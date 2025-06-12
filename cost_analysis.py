import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#Data Loading
filename = 'ehi_claims.csv'
cdf = pd.read_csv(filename)

print(cdf.head())
print(cdf.info())
print(cdf.columns)

#Cost Driver Analysis:
# By Service Type (Claim Type):
approveddf = cdf[cdf['ClaimStatus'] == 'Approved']
claim_summ1 =approveddf.groupby('ClaimType')['ClaimAmount'].sum().reset_index()

#Visualizatiion
plt.figure(figsize=(10,6))
sns.barplot(data = claim_summ1, x = 'ClaimType', y= 'ClaimAmount', palette= 'viridis')
plt.title('Total Claim Amount by Claim Type (For Approved Claims Only)')
plt.xlabel('Claim Type')
plt.ylabel('Total Claim Amount')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


# By Gender:
claim_summ2 =approveddf.groupby('PatientGender')['ClaimAmount'].sum().reset_index()

#Visualization
plt.figure(figsize=(8,4))
sns.barplot(data = claim_summ2, x = 'PatientGender', y= 'ClaimAmount', palette= 'pastel')
plt.title('Total Claim Amount by Gender (For Approved Claims Only)')
plt.xlabel('Patient Gender')
plt.ylabel('Total Claim Amount')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

#By Provider Specialty
claim_summ3 = approveddf.groupby('ProviderSpecialty')['ClaimAmount'].sum().reset_index()

#Visualization
plt.figure(figsize=(10,6))
sns.barplot(data=claim_summ3, x = 'ProviderSpecialty', y ='ClaimAmount', palette = 'pastel')
plt.title('Total Claim Amount by Provider Specialty (For Approved Claims Only)')
plt.xlabel('Provider Specialty')
plt.ylabel('Total Claim Amount')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

# Average Claim Cost Per Employment Status

claim_summ4 = approveddf.groupby('PatientEmploymentStatus')['ClaimAmount'].mean().reset_index()

#Visualization
plt.figure(figsize=(10,6))
sns.barplot(data=claim_summ4, x = 'PatientEmploymentStatus', y ='ClaimAmount', palette = 'muted')
plt.title('Average Claim Amount Per Patient Employment Status (For Approved Claims Only)')
plt.xlabel('Patient Employment Status')
plt.ylabel('Average Claim Amount')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


print(approveddf['ClaimStatus'])