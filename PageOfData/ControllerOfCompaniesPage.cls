public with sharing class ControllerOfCompaniesPage 
{
	public List<CompaniesPageWrapper> wrappersList {get;set;}

	public Company appleCompany;
	public Company microsoftCompany;
	public Order appleOrder; 
	public Order microsoftOrder;
	public Rate appleRate;
	public Rate microsoftRate;
	public WorkPeriod appleWorkPeriod;
	public WorkPeriod microsoftWorkPeriod;


	public ControllerOfCompaniesPage() 
	{
		createData();
		wrappersList = getData();
	}

	private List<CompaniesPageWrapper> getData()
	{
		List<CompaniesPageWrapper> wrappersList = new List<CompaniesPageWrapper>();

		wrappersList.add(new CompaniesPageWrapper('Name', appleCompany.getName(), microsoftCompany.getName()));
		wrappersList.add(new CompaniesPageWrapper('Work period', appleWorkPeriod.getName(), 
													microsoftWorkPeriod.getName()));
		wrappersList.add(new CompaniesPageWrapper('Revenue ammount', appleRate.getRevenue(), 
													microsoftRate.getRevenue()));
		wrappersList.add(new CompaniesPageWrapper('Margin ammount', appleRate.getMargin(), 
													microsoftRate.getMargin()));
		return wrappersList;
	}

	public class CompaniesPageWrapper
	{
		public String rowDescription {get;set;}
		public Object apple {get;set;}
		public Object microsoft {get;set;}

		public CompaniesPageWrapper(String rowDescription, Object apple, Object microsoft)
		{
			this.rowDescription = rowDescription;
			this.apple = apple;
			this.microsoft = microsoft;
		}	
	}

	private void createData()
	{

        appleCompany = new Company('Apple', '1');
		microsoftCompany = new Company('Microsoft', '2');

        appleOrder = new Order('Apple Order', '1', appleCompany); 
		microsoftOrder = new Order('Microsoft Order', '2', microsoftCompany);
       
        appleRate = new Rate('Apple rate', '1', 5000, 10000);
        microsoftRate = new Rate('Microsoft rate', '2', 7000, 15000);

        appleWorkPeriod = new WorkPeriod('Apple Work Period', '1', appleOrder, 
        								appleRate, Date.today().addDays(-50), Date.today().addDays(-20)); 
		microsoftWorkPeriod = new WorkPeriod('Microsoft Work Period', '2', microsoftOrder, 
        								microsoftRate, Date.today().addDays(-30), Date.today().addDays(-10));
	}
}