CREATE DATABASE AOL
USE AOL

-- Table: TransactionData
CREATE TABLE TransactionData (
TransactionID VARCHAR(10) PRIMARY KEY,
TransactionDate DATE NOT NULL,
TransactionPriority VARCHAR(50) NOT NULL
);
-- Table: EnergyPlan
CREATE TABLE EnergyPlan (
EnergyPlanID VARCHAR(10) PRIMARY KEY,
EnergyPlan VARCHAR(50) NOT NULL,
EnergyPlanDescription TEXT
);
-- Table: GroupCustomer
CREATE TABLE GroupCustomer (
GroupCustomerID VARCHAR(10) PRIMARY KEY,
GroupCustomer VARCHAR(50) NOT NULL
);
-- Table: EnergyType
CREATE TABLE EnergyType (
EnergyTypeID VARCHAR(10) PRIMARY KEY,
EnergyType VARCHAR(50) NOT NULL
);
-- Table: EnergyUsage
CREATE TABLE EnergyUsage (
EnergyUsageID VARCHAR(10) PRIMARY KEY,
EnergyConsumed DECIMAL(10, 2) NOT NULL,
PeakUsage DECIMAL(10, 2) NOT NULL,
OffPeakUsage DECIMAL(10, 2) NOT NULL,
Emissions DECIMAL(10, 2) NOT NULL
);
-- Table: FuelType
CREATE TABLE FuelType (
FuelTypeID VARCHAR(10) PRIMARY KEY,
FuelType VARCHAR(50) NOT NULL
);
-- Table: PowerPlantLocation
CREATE TABLE PowerPlantLocation (
PowerPlantLocationID VARCHAR(10) PRIMARY KEY,
PowerPlantLocation VARCHAR(50) NOT NULL
);
-- Table: PowerPlantStatus
CREATE TABLE PowerPlantStatus (
PowerPlantStatusID VARCHAR(10) PRIMARY KEY,
PowerPlantStatus VARCHAR(50) NOT NULL
);
-- Table: PaymentStatus
CREATE TABLE PaymentStatus (
PaymentStatusID VARCHAR(10) PRIMARY KEY,
BillingAmount DECIMAL(10, 2) NOT NULL,
PaymentStatus VARCHAR(50) NOT NULL
);
-- Table: ContractStatus
CREATE TABLE ContractStatus (
ContractStatusID VARCHAR(10) PRIMARY KEY,
ContractStatus VARCHAR(50) NOT NULL
);

-- Table: Customer
CREATE TABLE Customer (
CustomerID VARCHAR(10) PRIMARY KEY,
GroupCustomerID VARCHAR(10),
CustomerName VARCHAR(100) NOT NULL,
CustomerAddress VARCHAR(200),
AccountNumber INT NOT NULL,
FOREIGN KEY (GroupCustomerID) REFERENCES
GroupCustomer(GroupCustomerID)
);
-- Table: EnergySource
CREATE TABLE EnergySource (
EnergySourceID VARCHAR(10) PRIMARY KEY,
FuelTypeID VARCHAR(10),
EnergySource VARCHAR(50) NOT NULL,
FOREIGN KEY (FuelTypeID) REFERENCES
FuelType(FuelTypeID)
);
-- Table: PowerPlant
CREATE TABLE PowerPlant (
PowerPlantID VARCHAR(10) PRIMARY KEY,
PowerPlantLocationID VARCHAR(10),
PowerPlantStatusID VARCHAR(10),
PowerPlantCapacity INT NOT NULL,
PowerPlantCapacityCategory VARCHAR(50),
FOREIGN KEY (PowerPlantLocationID) REFERENCES
PowerPlantLocation(PowerPlantLocationID),
FOREIGN KEY (PowerPlantStatusID) REFERENCES
PowerPlantStatus(PowerPlantStatusID)
);
-- Table: Contract
CREATE TABLE Contract (
ContractID VARCHAR(10) PRIMARY KEY,
ContractStatusID VARCHAR(10),
ContractStartDate DATE NOT NULL,
ContractEndDate DATE NOT NULL,
FOREIGN KEY (ContractStatusID) REFERENCES
ContractStatus(ContractStatusID)
);

CREATE TABLE [Transaction] (
    TransactionID VARCHAR(10),
    EnergySourceID VARCHAR(10),
    CustomerID VARCHAR(10),
    EnergyPlanID VARCHAR(10),
    PowerPlantID VARCHAR(10),
    EnergyTypeID VARCHAR(10),
    EnergyUsageID VARCHAR(10),
    PaymentStatusID VARCHAR(10),
    ContractID VARCHAR(10),
    EnergyProduced DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (TransactionID, EnergySourceID),
    FOREIGN KEY (TransactionID) REFERENCES TransactionData(TransactionID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EnergyPlanID) REFERENCES EnergyPlan(EnergyPlanID),
    FOREIGN KEY (PowerPlantID) REFERENCES PowerPlant(PowerPlantID),
    FOREIGN KEY (EnergySourceID) REFERENCES EnergySource(EnergySourceID),
    FOREIGN KEY (EnergyTypeID) REFERENCES EnergyType(EnergyTypeID),
    FOREIGN KEY (EnergyUsageID) REFERENCES EnergyUsage(EnergyUsageID),
    FOREIGN KEY (PaymentStatusID) REFERENCES PaymentStatus(PaymentStatusID),
    FOREIGN KEY (ContractID) REFERENCES Contract(ContractID)
);


INSERT INTO TransactionData (TransactionID,
TransactionDate, TransactionPriority)
VALUES
('TRX01', '2024-01-01', 'Urgent'),
('TRX02', '2024-02-01', 'High Priority'),
('TRX03', '2024-01-15', 'Low Priority'),
('TRX04', '2024-02-01', 'Urgent'),
('TRX05', '2024-02-10', 'Not Urgent'),
('TRX06', '2024-02-10', 'Not Urgent');

INSERT INTO GroupCustomer (GroupCustomerID,
GroupCustomer)
VALUES
('GC01', 'Residential'),
('GC02', 'Business'),
('GC03', 'Industrial');

INSERT INTO FuelType (FuelTypeID, FuelType)
VALUES
('FU01', 'Solar'),
('FU02', 'Wind'),
('FU03', 'Coal'),
('FU04', 'Hydro'),
('FU05', 'Biomass');

INSERT INTO PowerPlantLocation (PowerPlantLocationID,
PowerPlantLocation) VALUES
('PL01', 'Jakarta'),
('PL02', 'Surabaya'),
('PL03', 'Bandung'),
('PL04', 'Yogyakarta'),
('PL05', 'Bali');

INSERT INTO PowerPlantStatus (PowerPlantStatusID,
PowerPlantStatus) VALUES
('PPS01', 'Operational'),
('PPS02', 'Under Construction'),
('PPS03', 'Under Maintenance');

INSERT INTO ContractStatus (ContractStatusID,
ContractStatus) VALUES
('CS01', 'Active'),
('CS02', 'Pending'),
('CS03', 'Renewed');

INSERT INTO EnergyType (EnergyTypeID, EnergyType)
VALUES
('ET001', 'Electricity'),
('ET002', 'Gas');

INSERT INTO EnergyPlan (EnergyPlanID, EnergyPlan, EnergyPlanDescription)
VALUES
('EP01', 'Plan A', 'A basic residential solar or wind energy plan offering 
medium capacity (200 MW) and zero emissions.'),
('EP02', 'Plan B', 'A residential coal-based plan offering large capacity 
(500 MW) with higher emissions for reliability.'),
('EP03', 'Plan C', 'A business plan using solar and hydro sources, with 
medium capacity (300 MW) and zero emissions.'),
('EP04', 'Plan D', 'An industrial plan with biomass and wind energy, offering 
large capacity (400 MW) with moderate emissions.'),
('EP05', 'Plan E', 'A residential plan with solar and wind, large capacity 
(600 MW) and zero emissions, designed for high usage.');

INSERT INTO EnergyUsage (EnergyUsageID, EnergyConsumed, PeakUsage, OffPeakUsage, Emissions)
VALUES
('EU001', 3000, 1800, 1200, 0),
('EU002', 3200, 1900, 1300, 0),
('EU003', 5000, 3500, 1500, 10),
('EU004', 6000, 3500, 2500, 0),
('EU005', 6200, 3700, 2700, 0),
('EU006', 7000, 4000, 3000, 500),
('EU007', 7200, 4200, 3200, 600),
('EU008', 8000, 4500, 3500, 0),
('EU009', 8200, 4700, 3700, 0);

INSERT INTO PaymentStatus (PaymentStatusID, BillingAmount, PaymentStatus)
VALUES
('PA01', 50, 'Paid'),
('PA02', 75, 'Pending'),
('PA03', 80, 'Paid'),
('PA04', 90, 'Paid'),
('PA05', 100, 'Pending'),
('PA06', 100, 'Waiting for Approval');

INSERT INTO EnergySource (EnergySourceID, FuelTypeID, EnergySource)
VALUES
('ES01', 'FU01', 'Solar'),
('ES02', 'FU02', 'Wind'),
('ES03', 'FU03', 'Coal'),
('ES04', 'FU04', 'Hydro'),
('ES05', 'FU05', 'Biomass');

INSERT INTO Customer (CustomerID, GroupCustomerID, CustomerName, CustomerAddress, AccountNumber)
VALUES
('CU001', 'GC01', 'John Doe', '123 Main St, Jakarta', 1001),
('CU002', 'GC01', 'Jane Smith', '456 Oak St, Surabaya', 1002),
('CU003', 'GC02', 'Alice Brown', '789 Pine St, Bandung', 1003),
('CU004', 'GC03', 'Bob White', '123 Cedar St, Yogyakarta', 1004),
('CU005', 'GC01', 'Chris Green', '987 Elm St, Bali', 1005),
('CU006', 'GC01', 'Nicholas Blue', '345 Sunset Place, Bandung', 1006);

INSERT INTO PowerPlant (PowerPlantID, PowerPlantLocationID, PowerPlantStatusID, PowerPlantCapacity,
PowerPlantCapacityCategory)
VALUES
('PP01', 'PL01', 'PPS01', 200, 'Medium'),
('PP02', 'PL02', 'PPS02', 500, 'Large'),
('PP03', 'PL03', 'PPS01', 300, 'Medium'),
('PP04', 'PL04', 'PPS01', 400, 'Large'),
('PP05', 'PL05', 'PPS03', 600, 'Large');

INSERT INTO [Contract] (ContractID, ContractStatusID, ContractStartDate, ContractEndDate)
VALUES
('CT001', 'CS01', '2024-01-01', '2025-01-01'),
('CT002', 'CS01', '2024-02-01', '2025-02-01'),
('CT003', 'CS01', '2024-01-15', '2025-01-15'),
('CT004', 'CS01', '2024-02-01', '2025-02-01'),
('CT005', 'CS02', '2024-02-10', '2025-02-10'),
('CT006', 'CS03', '2024-02-10', '2025-02-10');

INSERT INTO [Transaction] (TransactionID, EnergySourceID, CustomerID, EnergyPlanID, PowerPlantID,
EnergyTypeID, EnergyUsageID, PaymentStatusID, ContractID, EnergyProduced)
VALUES
('TRX01', 'ES01', 'CU001', 'EP01', 'PP01', 'ET001', 'EU001', 'PA01', 'CT001', 150),
('TRX01', 'ES02', 'CU001', 'EP01', 'PP01', 'ET001', 'EU002', 'PA01', 'CT001', 160),
('TRX02', 'ES03', 'CU002', 'EP02', 'PP02', 'ET002', 'EU003', 'PA02', 'CT002', 450),
('TRX03', 'ES01', 'CU003', 'EP03', 'PP03', 'ET001', 'EU004', 'PA03', 'CT003', 200),
('TRX03', 'ES04', 'CU003', 'EP03', 'PP03', 'ET001', 'EU005', 'PA03', 'CT003', 220),
('TRX04', 'ES05', 'CU004', 'EP04', 'PP04', 'ET001', 'EU006', 'PA04', 'CT004', 250),
('TRX04', 'ES02', 'CU004', 'EP04', 'PP04', 'ET001', 'EU007', 'PA04', 'CT004', 260),
('TRX05', 'ES01', 'CU005', 'EP05', 'PP05', 'ET001', 'EU008', 'PA05', 'CT005', 300),
('TRX06', 'ES02', 'CU006', 'EP05', 'PP05', 'ET001', 'EU009', 'PA06', 'CT006', 310);

SELECT t.TransactionID, c.CustomerID, c.CustomerName, c.CustomerAddress, c.AccountNumber, gc.GroupCustomer,
c.GroupCustomerID, ep.EnergyPlan, ep.EnergyPlanID, ep.EnergyPlanDescription, pp.PowerPlantID, pp.PowerPlantLocationID,
ppl.PowerPlantLocation, pp.PowerPlantCapacity, pp.PowerPlantCapacityCategory, pp.PowerPlantStatusID,
pps.PowerPlantStatus, es.EnergySource, es.EnergySourceID, f.FuelType, f.FuelTypeID, eu.Emissions, td.TransactionDate,
et.EnergyType, et.EnergyTypeID, t.EnergyUsageID, t.EnergyProduced, eu.EnergyConsumed, eu.PeakUsage, eu.OffPeakUsage,
ps.BillingAmount, ps.PaymentStatus, ps.PaymentStatusID, ct.ContractStartDate, ct.ContractEndDate, cs.ContractStatus,
ct.ContractStatusID, t.ContractID, td.TransactionPriority
FROM
[Transaction] t
INNER JOIN TransactionData td ON t.TransactionID = td.TransactionID
INNER JOIN Customer c ON t.CustomerID = c.CustomerID
LEFT JOIN GroupCustomer gc ON c.GroupCustomerID = gc.GroupCustomerID
INNER JOIN EnergyPlan ep ON t.EnergyPlanID = ep.EnergyPlanID
INNER JOIN PowerPlant pp ON t.PowerPlantID = pp.PowerPlantID
LEFT JOIN PowerPlantLocation ppl ON pp.PowerPlantLocationID = ppl.PowerPlantLocationID
LEFT JOIN PowerPlantStatus pps ON pp.PowerPlantStatusID = pps.PowerPlantStatusID
INNER JOIN EnergySource es ON t.EnergySourceID = es.EnergySourceID
LEFT JOIN FuelType f ON es.FuelTypeID = f.FuelTypeID
INNER JOIN EnergyUsage eu ON t.EnergyUsageID = eu.EnergyUsageID
INNER JOIN EnergyType et ON t.EnergyTypeID = et.EnergyTypeID
INNER JOIN PaymentStatus ps ON t.PaymentStatusID = ps.PaymentStatusID
INNER JOIN Contract ct ON t.ContractID = ct.ContractID
LEFT JOIN ContractStatus cs ON ct.ContractStatusID = cs.ContractStatusID;


