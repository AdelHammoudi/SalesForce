//**The class for creating data

public with sharing class DataCreator 
{
	private List<Object> objectList;
	private List<Company> companyList;
	private List<WorkPeriod> workPeriodList;

	public List<Company> getCompanyList()
	{
		companyList = new List<Company>();
		for(Object obj : objectList)
		{
			if(obj instanceof Company)
			{
				companyList.add((Company)obj);
			}
		}
		return companyList;
	}

	public List<WorkPeriod> getWorkPeriodList()
	{
		workPeriodList = new List<WorkPeriod>();
		for(Object obj : objectList)
		{
			if(obj instanceof WorkPeriod)
			{
				workPeriodList.add((WorkPeriod)obj);
			}
		}
		return workPeriodList;
	}

	public void createObjects()
	{
		objectList = new List<Object>();
		Company appleCompany = new Company('Apple', '1');
		Company microsoftCompany = new Company('Microsoft', '2');
		Order appleOrder = new Order('Apple Order', '1', appleCompany);
		Order microsoftOrder = new Order('Microsoft Order', '2', microsoftCompany);
		Rate appleRate = new Rate('Apple rate', '1', 5000, 10000);
		Rate microsoftRate = new Rate('Microsoft rate', '2', 7000, 15000);
		WorkPeriod appleWorkPeriod1 = new WorkPeriod('Apple Work Period1', '1', appleOrder, 
        								appleRate, Date.today().addDays(-50), Date.today().addDays(-20)); 
		WorkPeriod microsoftWorkPeriod1 = new WorkPeriod('Microsoft Work Period1', '2', microsoftOrder, 
        								microsoftRate, Date.today().addDays(-30), Date.today().addDays(-10));
		WorkPeriod appleWorkPeriod2 = new WorkPeriod('Apple Work Period2', '1', appleOrder, 
        								appleRate, Date.today().addDays(-50), Date.today().addDays(-20)); 
		WorkPeriod microsoftWorkPeriod2 = new WorkPeriod('Microsoft Work Period2', '2', microsoftOrder, 
        								microsoftRate, Date.today().addDays(-30), Date.today().addDays(-10));
		WorkPeriod appleWorkPeriod3 = new WorkPeriod('Apple Work Period3', '1', appleOrder, 
        								appleRate, Date.today().addDays(-50), Date.today().addDays(-20)); 
		
		objectList.add(appleCompany);
		objectList.add(microsoftCompany);
		objectList.add(appleOrder);
		objectList.add(microsoftOrder);
		objectList.add(appleRate);
		objectList.add(microsoftRate);
		objectList.add(microsoftWorkPeriod1);
		objectList.add(appleWorkPeriod1);
		objectList.add(appleWorkPeriod2);
		objectList.add(appleWorkPeriod3);
		objectList.add(microsoftWorkPeriod2);
	}
}