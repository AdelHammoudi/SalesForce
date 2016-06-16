public class Rate 
{
   private String name;
   private String id;
   private Integer revenue;
   private Integer margin;

    public Rate(String name, String id, Integer revenue, Integer margin)
    {
    	this.name = name;
    	this.id = id;
    	this.revenue = revenue;
    	this.margin = margin;
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

    public Integer getRevenue()
    {
    	return revenue;
    }

    public void setRevenue(Integer revenue)
    {
    	this.revenue = revenue;
    }

    public Integer getMargin()
    {
    	return margin;
    }

    public void setMargin(Integer margin)
    {
    	this.margin = margin;
    }
}