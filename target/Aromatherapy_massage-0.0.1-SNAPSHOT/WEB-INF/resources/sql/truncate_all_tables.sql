USE auromatherapy_massage;
GO

-- Disable foreign key constraints
ALTER TABLE POST NOCHECK CONSTRAINT ALL;
ALTER TABLE POST_TAG NOCHECK CONSTRAINT ALL;
ALTER TABLE SERVICE NOCHECK CONSTRAINT ALL;
ALTER TABLE COURSE NOCHECK CONSTRAINT ALL;
GO

-- Truncate each table
TRUNCATE TABLE POST_TAG;
TRUNCATE TABLE POST;
TRUNCATE TABLE TAG;
TRUNCATE TABLE POST_STATUS;
TRUNCATE TABLE SERVICE;
TRUNCATE TABLE COURSE;
TRUNCATE TABLE EMPLOYEE;
GO

-- Re-enable foreign key constraints
ALTER TABLE POST CHECK CONSTRAINT ALL;
ALTER TABLE POST_TAG CHECK CONSTRAINT ALL;
ALTER TABLE SERVICE CHECK CONSTRAINT ALL;
ALTER TABLE COURSE CHECK CONSTRAINT ALL;
GO