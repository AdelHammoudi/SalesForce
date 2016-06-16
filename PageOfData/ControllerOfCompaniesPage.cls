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
		createData();
		List<CompaniesPageWrapper> wrappersList = new List<CompaniesPageWrapper>();
		wrappersList.add(new CompaniesPageWrapper('Name', appleCompany.name, microsoftCompany.name));
		wrappersList.add(new CompaniesPageWrapper('Work period', appleWorkPeriod.name, microsoftWorkPeriod.name));
		wrappersList.add(new CompaniesPageWrapper('Work period start date', appleWorkPeriod.startDate, 
													microsoftWorkPeriod.startDate));
		wrappersList.add(new CompaniesPageWrapper('Margin ammount', appleRate.revenue, microsoftRate.revenue));
		wrappersList.add(new CompaniesPageWrapper('Revenue ammount', appleRate.margin, microsoftRate.margin));
		wrappersList.add(new CompaniesPageWrapper('Work period end date', appleWorkPeriod.endDate, 
													microsoftWorkPeriod.endDate));
		
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

        appleCompany = new Company();
		appleCompany.name = 'Apple';
		appleCompany.id = '1';

		microsoftCompany = new Company();
        microsoftCompany.name = 'Microsoft';
		microsoftCompany.id = '2';

        appleOrder = new Order();
        appleOrder.name = 'Apple Order';
        appleOrder.id = '1';
        appleOrder.companyId = appleCompany.id; 

		microsoftOrder = new Order();
        microsoftOrder.name = 'Apple Order';
        microsoftOrder.id = '2';
        microsoftOrder.companyId = microsoftCompany.id; 

        appleRate = new Rate();
        appleRate.name = 'Apple rate';
        appleRate.id = '1';
        appleRate.revenue = 50;
        appleRate.margin = 100;

        microsoftRate = new Rate();
        microsoftRate.name = 'Microsoft rate';
        microsoftRate.id = '1';
        microsoftRate.revenue = 150;
        microsoftRate.margin = 200;

        appleWorkPeriod = new WorkPeriod(); 
        appleWorkPeriod.name = 'Apple Work Period';
        appleWorkPeriod.orderId = appleOrder.id;
        appleWorkPeriod.rateId = appleRate.id;
        appleWorkPeriod.startDate = Date.today().addDays(5);
        appleWorkPeriod.endDate = Date.today().addDays(20);

		microsoftWorkPeriod = new WorkPeriod();
        microsoftWorkPeriod.name = 'Microsoft Work Period';
        microsoftWorkPeriod.orderId = microsoftOrder.id;
        microsoftWorkPeriod.rateId = microsoftRate.id;
        microsoftWorkPeriod.startDate = Date.today().addDays(10);
        microsoftWorkPeriod.endDate = Date.today().addDays(25);  
	}
}