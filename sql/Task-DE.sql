CREATE TABLE exporter (
  exporter_id INT PRIMARY KEY,
  iec_no VARCHAR(15) UNIQUE NOT NULL,
  exporter_name VARCHAR(200),
  Country VARCHAR(50)
);

CREATE TABLE shipment (
  shipment_id INT PRIMARY KEY,
  sb_no VARCHAR(20) UNIQUE NOT NULL,
  sb_date DATE,
  port_code VARCHAR(50),
  gateway VARCHAR(20),
  exporter_id INT NOT NULL
);

CREATE TABLE compliance (
  compliance_id INT PRIMARY KEY,
  sb_no VARCHAR(20) NOT NULL,
  egm_no VARCHAR(20),
  egm_date DATE,
  rosl_status VARCHAR(30),
  rosl_amount DECIMAL(12,2)
);

CREATE TABLE status_log (
  log_id INT PRIMARY KEY,
  sb_no VARCHAR(20) NOT NULL,
  current_status VARCHAR(30),
  status_date DATE
);

INSERT INTO exporter (exporter_id, iec_no, exporter_name, Country)
VALUES (1, '0597024561', 'ABC Exports Pvt Ltd', 'India');

INSERT INTO exporter (exporter_id, iec_no, exporter_name, Country)
VALUES (2, '0506074994', 'Global Trade Solutions Ltd', 'Singapore');

INSERT INTO exporter (exporter_id, iec_no, exporter_name, Country)
VALUES (3, '0513056661', 'Sunrise Agro Products', 'India');

INSERT INTO exporter (exporter_id, iec_no, exporter_name, Country)
VALUES (4, '0588055964', 'EuroTech Manufacturing GmbH', 'Germany');

INSERT INTO exporter (exporter_id, iec_no, exporter_name, Country)
VALUES (5, '0609003542', 'Pacific Textiles Co.', 'Australia');

select * from exporter;

INSERT ALL
  INTO shipment (shipment_id, sb_no, sb_date, port_code, gateway, exporter_id)
    VALUES (101, '7096937', DATE '2017-07-01', 'TUGLAKABAD ICD (INTKD6)', 'Sea', 1)
  INTO shipment (shipment_id, sb_no, sb_date, port_code, gateway, exporter_id)
    VALUES (102, '7100605', DATE '2017-07-01', 'TUGLAKABAD ICD (INTKD6)', 'Air', 2)
  INTO shipment (shipment_id, sb_no, sb_date, port_code, gateway, exporter_id)
    VALUES (103, '7183827', DATE '2017-07-06', 'TUGLAKABAD ICD (INTKD6)', 'Sea', 3)
  INTO shipment (shipment_id, sb_no, sb_date, port_code, gateway, exporter_id)
    VALUES (104, '7603758', DATE '2017-07-26', 'TUGLAKABAD ICD (INTKD6)', 'Rail', 4)
  INTO shipment (shipment_id, sb_no, sb_date, port_code, gateway, exporter_id)
    VALUES (105, '7616933', DATE '2017-07-26', 'TUGLAKABAD ICD (INTKD6)', 'Sea', 5)
SELECT * FROM dual;

select * from shipment;


INSERT ALL
  INTO compliance (compliance_id, sb_no, egm_no, egm_date, rosl_status, rosl_amount)
    VALUES (201, '7096937', 'Z17061407', DATE '2017-07-14', 'Not Claimed', 0)
  INTO compliance (compliance_id, sb_no, egm_no, egm_date, rosl_status, rosl_amount)
    VALUES (202, '7100605', 'R957660607', DATE '2017-07-06', 'Not Claimed', 0)
  INTO compliance (compliance_id, sb_no, egm_no, egm_date, rosl_status, rosl_amount)
    VALUES (203, '7183827', 'R247461607', DATE '2017-07-16', 'Not Claimed', 0)
  INTO compliance (compliance_id, sb_no, egm_no, egm_date, rosl_status, rosl_amount)
    VALUES (204, '7603758', 'R1817100108', DATE '2017-08-01', 'Not Claimed', 0)
  INTO compliance (compliance_id, sb_no, egm_no, egm_date, rosl_status, rosl_amount)
    VALUES (205, '7616933', 'R237360308', DATE '2017-08-03', 'Not Claimed', 0)
SELECT * FROM dual;


INSERT ALL
  INTO status_log (log_id, sb_no, current_status, status_date)
    VALUES (301, '7096937', 'LEO Issued', DATE '2017-07-12')
  INTO status_log (log_id, sb_no, current_status, status_date)
    VALUES (302, '7100605', 'LEO Issued', DATE '2017-07-04')
  INTO status_log (log_id, sb_no, current_status, status_date)
    VALUES (303, '7183827', 'LEO Issued', DATE '2017-07-07')
  INTO status_log (log_id, sb_no, current_status, status_date)
    VALUES (304, '7603758', 'LEO Issued', DATE '2017-07-27')
  INTO status_log (log_id, sb_no, current_status, status_date)
    VALUES (305, '7616933', 'LEO Issued', DATE '2017-07-28')
SELECT * FROM dual;

select * from status_log;

SELECT s.sb_no, s.sb_date, s.port_code, s.gateway,
e.exporter_name, e.country,
c.egm_no, c.egm_date, c.rosl_status, c.rosl_amount
FROM shipment s
JOIN exporter e ON s.exporter_id = e.exporter_id
LEFT JOIN compliance c ON s.sb_no = c.sb_no
ORDER BY s.sb_date;

SELECT s.sb_no, e.exporter_name, c.rosl_status
FROM shipment s
JOIN exporter e ON s.exporter_id = e.exporter_id
JOIN compliance c ON s.sb_no = c.sb_no
WHERE c.rosl_status = 'Not Claimed';

SELECT gateway, COUNT(*) AS shipment_count
FROM shipment
GROUP BY gateway
ORDER BY shipment_count DESC;

SELECT e.exporter_name, SUM(c.rosl_amount) AS total_rosl
FROM exporter e
JOIN shipment s ON e.exporter_id = s.exporter_id
JOIN compliance c ON s.sb_no = c.sb_no
WHERE c.rosl_status = 'Claimed'
GROUP BY e.exporter_name
ORDER BY total_rosl DESC;

WITH rosl_summary AS (
SELECT s.exporter_id,
AVG(c.rosl_amount) AS avg_rosl,
COUNT(*) AS shipment_count
FROM shipment s
JOIN compliance c ON s.sb_no = c.sb_no
GROUP BY s.exporter_id
)
SELECT e.exporter_name, e.country, r.avg_rosl, r.shipment_count
FROM exporter e
JOIN rosl_summary r ON e.exporter_id = r.exporter_id
ORDER BY r.avg_rosl DESC;


















