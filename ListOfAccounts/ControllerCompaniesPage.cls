public with sharing class ControllerCompaniesPage {
	public List<CompaniesPageWrapper> wrappersList {get;set;}
	public Company firstCompany {get;set;}
	public Company secondCompany {get;set;}

	public ControllerCompaniesPage() 
	{
		wrappersList = getData();
	}

	private List<CompaniesPageWrapper> getData()
	{
		DataCreator data = new  DataCreator();
		data.createObjects();
		List<Company> companyList = data.getCompanyList();
		firstCompany = companyList.get(0);
		secondCompany = companyList.get(1);
		List<WorkPeriod> workPeriodList = data.getWorkPeriodList();
		List<CompaniesPageWrapper> wrappersList = new List<CompaniesPageWrapper>();
		
		for (WorkPeriod workPeriodTemp : workPeriodList)
		{
			wrappersList.add(new CompaniesPageWrapper(workPeriodTemp.getName(), workPeriodTemp, companyList));
		}
		return wrappersList;
	}

	public class CompaniesPageWrapper
	{
		public WorkPeriod firstCompanyWorkPeriod {get;set;}
		public WorkPeriod secondCompanyWorkPeriod {get;set;}
		public String workPeriodName {get;set;}
		public boolean firstCompanyIsNull {get;set;}
		public boolean secondCompanyIsNull {get;set;}

		public CompaniesPageWrapper(String workPeriodName, WorkPeriod workPeriod, List<Company> companyList)
		{
			this.workPeriodName = workPeriodName;
			if(workPeriod.getOrder().getCompany().equals(companyList.get(0)))
			{
				this.firstCompanyWorkPeriod = workPeriod;
				this.secondCompanyWorkPeriod = null;
				firstCompanyIsNull = true;
			}
			else
			{
				this.firstCompanyWorkPeriod = null;
				this.secondCompanyWorkPeriod = workPeriod;
				secondCompanyIsNull = true;
			}
		}	
	}
}