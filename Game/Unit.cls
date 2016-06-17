/**
 * Unit class represents a players of game. 
 * 
 * @author  Adel Hammoudi
 * @version 1.0, June 2016
 */
public class Unit {
	
    private String name;
    private Integer hp;
    private Integer dmgMin;
    private Integer dmgMax;

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public Integer getHp()
    {
        return hp;
    }

    public void setHp(Integer hp)
    {
        this.hp = hp;
    }
    
    public Integer getDmgMin()
    {
        return dmgMin;
    }

    public void setDmgMin(Integer dmgMin)
    {
        this.dmgMin = dmgMin;
    }

    public Integer getDmgMax()
    {
        return DmgMax;
    }

    public void setDmgMax(Integer dmgMax)
    {
        this.dmgMax = dmgMax;
    }

    /**
     * Return integer which depend on type of the block and type of the kick.
     * @param blockType type of the block
     * @see  #getBlockType()
     * @see  #getKickType()
     */
    public Integer getKick(KickBlockTypes blockType)
    {
        KickBlockTypes kickType = getKickType();
        Integer kick;
        if (kickType == blockType)
        {
            kick = (Integer)(Math.abs(Math.random() * (this.dmgMin - this.dmgMax + 1) + this.dmgMin));
        }
        else
        {
             kick = 0;
        }
    	return kick;
    }

    /**
     * Return random KickBlockTypes enum with probability: HEAD - 40%, CHEST - 30%, ARMS - 15%, LEGS - 15%.
     */
    public KickBlockTypes getBlockType()
    {
        KickBlockTypes blockType;
        Integer i = (Integer)(Math.random()*100);
        if (i < 40)
        {
            blockType = KickBlockTypes.HEAD;
            
        }
        else 
            if (i <70)
            {
                blockType = KickBlockTypes.CHEST;
            }
            else 
                if (i < 85)
                {
                    blockType = KickBlockTypes.ARMS;
                }
                else
                {
                    blockType = KickBlockTypes.LEGS;
                }
        return blockType;
    }

    /**
     *Return random KickBlockTypes enum with probability: HEAD - 40%, CHEST - 30%, ARMS - 15%, LEGS - 15%.
     */
    public KickBlockTypes getKickType()
    {
        KickBlockTypes kickType;
        Integer i = (Integer)(Math.random()*100);
        if (i < 40)
        {
            kickType = KickBlockTypes.HEAD;
        }
        else 
            if (i < 70)
            {
                 kickType = KickBlockTypes.CHEST;
            }
            else 
                if (i < 85)
                {
                    kickType = KickBlockTypes.ARMS;
                }
                else
                {
                    kickType = KickBlockTypes.LEGS;
                }
        return kickType;
    }

    /**
     * Return true if player's hp more then 0.
     */
    public boolean isLive()
    {
    	boolean isLive  = true;
    	if (this.hp <= 0)
    		isLive = false;
    	return isLive;
    }
}