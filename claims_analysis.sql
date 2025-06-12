-- Import csv file
CREATE TABLE claims (ClaimID varchar PRIMARY KEY,
			PatientID varchar,
			ProviderID varchar,
			ClaimAmount float,
			ClaimDate date,
			DiagnosisCode varchar,
			ProcedureCode varchar,
			PatientAge int,
			PatientGender varchar,
			ProviderSpecialty varchar,
			ClaimStatus varchar,
			PatientIncome float,
			PatientMaritalStatus varchar,
			PatientEmploymentStatus varchar,
			ProviderLocation varchar,
			ClaimType varchar,
			ClaimSubmissionMethod varchar)

select * from claims


-- Cost Driver Analysis:
-- 1. Analyze cost based on claim type for approved claims only
SELECT claimtype, SUM(claimamount) as total_claim_amount FROM claims
WHERE claimstatus = 'Approved'
GROUP BY claimtype
ORDER BY total_claim_amount DESC

-- 2 Which diagnosis codes contributed to high costs? (Only approved claims) 
SELECT diagnosiscode, SUM(claimamount) as total_claim_amount FROM claims
WHERE claimstatus = 'Approved'
GROUP BY diagnosiscode
ORDER BY total_claim_amount DESC
LIMIT 10


-- 3 Patient demographics 
-- 3.1 Which gender experiences higher costs?
SELECT patientgender, SUM(claimamount) as total_claim_amount, COUNT(*) as total_claims FROM claims
WHERE claimstatus = 'Approved'
GROUP BY patientgender
ORDER BY total_claim_amount DESC

-- 3.2 Examine cost by provider specialty
SELECT providerspecialty, SUM(claimamount) as total_claim_amount, count(*) as total_claims FROM claims
WHERE claimstatus = 'Approved'
GROUP BY providerspecialty
ORDER BY total_claim_amount DESC

-- 3.3 Examine cost by age
SELECT patientage, SUM(claimamount) as total_claim_amount FROM claims
WHERE claimstatus = 'Approved'
GROUP BY patientage
ORDER BY total_claim_amount DESC

SELECT FLOOR (patientage/10) *10 as age_group, SUM(claimamount) as total_claim_amount, count(*) as total_claims FROM claims
WHERE claimstatus = 'Approved'
GROUP BY patientage
ORDER BY total_claim_amount DESC
LIMIT 10

-- 3.4 Examine cost by provider location 
SELECT providerlocation, SUM(claimamount) as total_claim_amount, count(*) as total_claims FROM claims
WHERE claimstatus = 'Approved'
GROUP BY providerlocation
ORDER BY total_claim_amount DESC
LIMIT 10

-- What is the average claim cost for approved claims?
SELECT avg(claimamount) as claim_amount FROM claims
WHERE claimstatus = 'Approved'

-- What is the total number of approved claims?
SELECT count(*) as Total_Approved_Claims FROM claims
WHERE claimstatus = 'Approved'

