CREATE TABLE Customer (
    cust_Id VARCHAR2(6) NOT NULL,
    email VARCHAR2(35) NOT NULL,
    name VARCHAR2(51) NOT NULL,
    tel VARCHAR2(15) NOT NULL,
    dob DATE,
    gender VARCHAR2(1),
    PRIMARY KEY (cust_Id),
    CONSTRAINT chk_gender CHECK (UPPER(gender) IN ('M','F')),
    CONSTRAINT chk_email CHECK (REGEXP_LIKE(email, '^[a-zA-Z]\w+@(\S+)$')),
    CONSTRAINT chk_tel CHECK (REGEXP_LIKE(tel, '^\d{3}-\d{3}-\d{4}$'))
);
