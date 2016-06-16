public class Order 
{
    private String name;
    private String id;
    private Company company;

    public Order(String name, String id, Company company)
    {
    	this.name = name;
    	this.id = id;
    	this.company = company;
    }

    public String getName()
    {
    	return name;
    }

    public void setName(String name)
    {
    	this.name = name;
    }

    public String getId()
    {
    	return id;
    }

    public void setId(String id)
    {
    	this.id = id;
    }

    public Company getCompany()
    {
    	return company;
    }

    public void setCompany(Company company)
    {
    	this.company = company;
    }

}