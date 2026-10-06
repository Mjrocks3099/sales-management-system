CREATE DATABASE IF NOT EXISTS simp;

USE simp;


-- ==========================================
-- CREATE TABLES
-- ==========================================

CREATE TABLE IF NOT EXISTS product_type (
    product_type_id BIGINT NOT NULL,
    p_type VARCHAR(100) NOT NULL,
    PRIMARY KEY (product_type_id)
);


CREATE TABLE IF NOT EXISTS products (
    p_id BIGINT NOT NULL,
    p_cost DECIMAL(15,2) NOT NULL,
    p_name VARCHAR(255) NOT NULL,
    p_type VARCHAR(100) NOT NULL,
    PRIMARY KEY (p_id)
);


CREATE TABLE IF NOT EXISTS commission_structure (
    commission_id BIGINT NOT NULL,
    commission_percentage DECIMAL(5,2) NOT NULL,
    end_range DECIMAL(15,2),
    product_type_id BIGINT NOT NULL,
    start_range DECIMAL(15,2) NOT NULL,

    PRIMARY KEY (commission_id),

    CONSTRAINT fk_commission_product_type
        FOREIGN KEY (product_type_id)
        REFERENCES product_type(product_type_id)
);


-- ==========================================
-- INSERT INITIAL DATA
-- ==========================================

INSERT INTO product_type
    (product_type_id, p_type)
VALUES
    (1, '2 Wheeler'),
    (2, '3 Wheeler'),
    (3, '4 Wheeler'),
    (4, 'Commercial Vehicle');


INSERT INTO products
    (p_id, p_cost, p_name, p_type)
VALUES
    (1, 60000, 'Honda', '2 Wheeler'),
    (2, 70000, 'TVS', '2 Wheeler'),
    (3, 1100000, 'Toyota', '4 Wheeler'),
    (4, 2000000, 'Ashok Leyland', 'Commercial Vehicle'),
    (5, 5000000, 'BMW', '4 Wheeler'),
    (6, 1500000, 'Mahindra', '4 Wheeler'),
    (7, 200000, 'Bajaj', '3 Wheeler'),
    (8, 1000000, 'Volvo', 'Commercial Vehicle'),
    (9, 350000, 'Piaggio', '3 Wheeler'),
    (10, 90000, 'Yamaha', '2 Wheeler');


INSERT INTO commission_structure
    (
        commission_id,
        commission_percentage,
        end_range,
        product_type_id,
        start_range
    )
VALUES
    (1, 3, 30000, 1, 0),
    (2, 5, 50000, 1, 30000),
    (3, 8, NULL, 1, 50000),

    (4, 3, 50000, 2, 0),
    (5, 5, NULL, 2, 50000),

    (6, 4, 100000, 3, 0),
    (7, 6, 500000, 3, 100000),
    (8, 10, NULL, 3, 500000),

    (9, 6, 500000, 4, 0),
    (10, 11, NULL, 4, 500000);