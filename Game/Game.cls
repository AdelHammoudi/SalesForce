/**
 * Game class is class for creating players and for starting game.
 * 
 * @author  Adel Hammoudi
 * @version 1.0, June 2016
 */
public class Game 
{
    private List<String> gameDescriptionList;
    private Unit unit1;
    private Unit unit2;

    /**
    * Class constructor specifying players of objects to create.
    * Game starting with step of random player.
    * Record which was lost will be updated
    * @param  player1 record type Unit__c 
    * @param  player2 record type Unit__c
    * @see  Game#fight();
    */
    public Game(Unit__c player1, Unit__c player2)
    {
        Unit winner;
        createPlayers(player1, player2);
    	List<String> gameDescriptionList = new List<String>();
    	Integer i = (Integer)(Math.random()*2);
    	if (i == 0)
    	{
    		winner = fight(unit1, unit2);
            if(winner.equals(unit1))
            {
               player2.Last_Loss_Date__c = Date.today();
            }
            else
            if(winner.equals(unit2))
            {
                player1.Last_Loss_Date__c = Date.today();
            }
    	}
    	else
    	{
    		winner = fight(unit2, unit1);
            if(winner.equals(unit2))
            {
               player1.Last_Loss_Date__c = Date.today();
            }
            else
            if(winner.equals(unit1))
            {
                player2.Last_Loss_Date__c = Date.today();
            }
    	}
    }
    
    public List<String> getGameDescriptionList()
    {
        return gameDescriptionList;
    }



    /**
    * This is the method which add a new record.
    * @param  player1 record type Unit__c 
    * @param  player2 record type Unit__c 
    * @see  Game#Game()
    * @return Nothing
    */
    private void createPlayers(Unit__c player1,Unit__c player2)
    {
        unit1 = new Unit();
        unit1.setName(player1.name);
        unit1.setHp((Integer)player1.hp__c);
        unit1.setDmgMin((Integer)player1.Min_Damage__c);
        unit1.setDmgMax((Integer)player1.Max_Damage__c);
        unit2 = new Unit();
        unit2.setName(player2.name);
        unit2.setHp((Integer)player2.hp__c);
        unit2.setDmgMin((Integer)player2.Min_Damage__c);
        unit2.setDmgMax((Integer)player2.Max_Damage__c);
    }

    /**
     * Launch a fight between players
     * @param unit1 player of game
     * @param unit2 player of game
     * @see Unit#createPlayers
     * @see  Unit#getKick(KickBlockTypes)
     * @see  Unit#getBlockType()
     * @see  Unit#getKickType()
     */
    private Unit fight(Unit unit1, Unit unit2)
    {
        gameDescriptionList = new List<String>();
        Unit winner = new Unit();
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
	    			gameDescriptionList.add(unit1.getName() + '\'s kick was blocked!');
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
                    winner = unit1;
			    	break;
			    }
			    	
		    	kick = unit2.getKick(unit1.getBlockType());
	    		if (kick == 0)
	    		{
	    			gameDescriptionList.add(unit2.getName() + '\'s kick was blocked!');
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
                    winner = unit2;
			    	break;
			    }
		    }
        }
        return winner;
    }
}