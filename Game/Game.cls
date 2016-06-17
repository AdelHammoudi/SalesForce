/**
 * Game class is class for creating players and for starting game.
 * 
 * @author  Adel Hammoudi
 * @version 1.0, June 2016
 */
public class Game 
{
    private List<String> gameDescriptionList = new List<String>();

    /**
    * Class constructor specifying players of objects to create.
    * Game starting with step of random player.
    *@see  #fight();
    */
    public Game(Unit unit1, Unit unit2)
    {
    	List<String> gameDescriptionList = new List<String>();
    	Integer i = (Integer)(Math.random()*2);
    	if (i == 0)
    	{
    		fight(unit1, unit2);
    	}
    	else
    	{
    		fight(unit2, unit1);
    	}	
    }
    
    public List<String> getGameDescriptionList()
    {
        return gameDescriptionList;
    }

    /**
     * Launch a fight between players
     * @param unit1 player of game
     * @param unit2 player of game
     * @see  Unit#getKick(KickBlockTypes)
     * @see  Unit#getBlockType()
     * @see  Unit#getKickType()
     */
    private void fight(Unit unit1, Unit unit2)
    {
       	if(!unit1.isLive() || !unit2.isLive())
    	{
            gameDescriptionList.add('Somebody was born dead!');
            gameDescriptionList.add('Game over!');
        }
    	else
        {
            gameDescriptionList.add('Game start!');
            while(true)
	    	{
	    		Integer kick;

	    		kick = unit1.getKick(unit2.getBlockType());
	    		if (kick == 0)
	    		{
	    			gameDescriptionList.add(unit1.getName() + '` kick was blocked!');
	    		}
	    		else
	    		{
	    			unit2.setHp(unit2.getHp() - kick);
	    			gameDescriptionList.add(unit1.getName() + ' kicked on ' + kick + ' hp');
	    		}    		
	    		gameDescriptionList.add('Balance Hp: ' + unit1.getName() + ': ' + unit1.getHp() + '; ' 
	    								+ unit2.getName() + ': ' + unit2.getHp());
	    		if(!unit2.isLive())
			    {
			    	gameDescriptionList.add(unit1.getName() + ' win!');
			    	gameDescriptionList.add('Game over!');
			    	break;
			    }
			    	
		    	kick = unit2.getKick(unit1.getBlockType());
	    		if (kick == 0)
	    		{
	    			gameDescriptionList.add(unit2.getName() + '` kick was blocked!');
	    		}
	    		else
	    		{
	    			unit1.setHp(unit1.getHp() - kick);
	    			gameDescriptionList.add(unit2.getName() + ' kicked on ' + kick + ' hp');	
	    		}    		
	    		gameDescriptionList.add('Balance Hp: ' + unit1.getName() + ': ' + unit1.getHp() + '; '
	    								 + unit2.getName() + ': ' + unit2.getHp());
	    		if(!unit1.isLive())
			    {
			    	gameDescriptionList.add(unit2.getName() + ' win!');
			    	gameDescriptionList.add('Game over!');
			    	break;
			    }
		    }
        }
    }
}