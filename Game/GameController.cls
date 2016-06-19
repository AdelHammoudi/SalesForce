/**
 * GameController is a controller of VF page TheGame . 
 * Before using this class need to create castom object as follow:
 * API Name: Unit__c 
 * Custom Fields:
 * 1. API Name: Hp__c, Data Type: Number
 * 2. API Name: Min_Damage__c, Data Type: Number
 * 3. API Name: Max_Damage__c, Data Type: Number
 * 4. API Name: Last_Loss_Date__c Data Type: Date
 * If game was lost, you can't use record during 1 day
 * You can delete any record any time using button delete
 * Boolean variables except isButtonsDisabled using for rendering page's output panel
 * 
 * @author  Adel Hammoudi
 * @version 1.0, June 2016
 */
public class GameController 
{
    public Unit__c unit {get;set;}
    public List<GameWrapper> unitList {get;set;}  
    public List<Unit__c> selectedUnitList {get;set;}
    public List<String> gameDescriptionList {get;set;}
    public boolean selectPlayers {get;set;}
    public boolean newPlayer {get;set;}
    public boolean deletePlayers {get;set;}
    public boolean isButtonsDisabled {get;set;}
    public boolean gameDescription {get;set;}
    
    public GameController()
    {
        unitList = getData();
        unit = new Unit__c();
        selectPlayers = true;
    }

    /**
    * This is the method which enabled panel for adding new player.
    * @return null.
    */
    public PageReference addPlayer()
    {
        selectedUnitList = new List<Unit__c>();
        unitList = getData();
        selectPlayers = false;
        deletePlayers = false;
        isButtonsDisabled = true;
        newPlayer = true;
        return null;
    }

    /**
    * This is the method which enabled panel for deleting players.
    * @return null.
    */
    public PageReference deletePlayers()
    {
        unitList = getData();
        selectPlayers = false;
        deletePlayers = true;
        newPlayer = false;
        isButtonsDisabled = true;
        gameDescription = false;
        return null;
    }

    /**
    * This is the method which add a new record.
    * Input values must be according to bellow:
    * Name not blank
    * Hp > 0
    * Min Damage > 0
    * Max Damage > 0
    * Input values will be checked and in case if will be found discrepancy
    * with above mentioned criterias , error message wil display on VF page
    * @return Null
    */
    public PageReference addNewPlayer()
    {
        if(unit.name != null)
        {
            if(unit.hp__c > 0)
            {
                if(unit.Min_Damage__c >= 0)
                {
                    if(unit.Max_Damage__c >= unit.Min_Damage__c)
                    {
                        insert unit; 
                        unit = new Unit__c();
                        selectedUnitList = new List<Unit__c>();
                        unitList = getData();
                        selectPlayers = true;
                        newPlayer = false;
                        isButtonsDisabled = false;
                        gameDescription = false; 
                    }
                    else
                    {
                        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,
                                                            'Max Damage must be more than Min Damage!'));
                    }
                    
                }
                else
                {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,
                                                            'Min Damage must be more than 0!'));
                }
            }
            else
            {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,
                                                            'Player Hp must be more than 0!'));
            }
        }
        else
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,
                                                        'Please enter player name!'));
        }
        return null;
    }

    /**
    * This is the method which delete selected records.
    * Input values must be according to bellow:
    * @return Null
    */
    public PageReference deleteSelectedPlayers()
    {
        selectedUnitList = new List<Unit__c>();
        for(GameWrapper wrap : unitList)
        {
            if(wrap.isSelected)
                {  
                    selectedUnitList.add(wrap.unit);  
                }  
        }
        delete selectedUnitList;
        unitList = getData();
        selectPlayers = true;
        newPlayer = false;
        deletePlayers = false;
        isButtonsDisabled = false;
        gameDescription = false;
        return null;
    }

    /**
    * This is the method which close delete/add_new_record panels and display record's panel.
    * @return Null
    */
    public PageReference cancel()
    {
        unit = new Unit__c();
        selectPlayers = true;
        newPlayer = false;
        deletePlayers = false;
        isButtonsDisabled = false;
        gameDescription = false;
        return null;
    }

    /**
    * This is the method which select records from database and create wrapper class objects
    * @see GameController#GameWrapper
    * @return List<GameWrapper>.
    */
    private List<GameWrapper> getData()
    {
        List<GameWrapper> unitList = new List<GameWrapper>();
        for(Unit__c unitTemp : [SELECT Name, Hp__c, Min_Damage__c, Max_Damage__c, 
                                Last_Loss_Date__C FROM Unit__c])
        {
            unitList.add(new GameWrapper(unitTemp, false));
        }
        return unitList;
    }

    /**
    * This is the wrapper class for display records as follow:
    * If record's last loss date is less than 1 day you can't select this record but 
    * you can delete it by using delete button
    * @see GameController#getData()
    */
    public class GameWrapper
    {
        public Unit__c unit {get; set;}
        public boolean isSelected {get; set;}
        public boolean isDisabled {get; set;}
        
        public GameWrapper(Unit__c unit, boolean isSelected) 
        {
            Date today = Date.today();
            if(unit.Last_Loss_Date__c != null)
            {
                if(unit.Last_Loss_Date__c.daysBetween(today) <= 1)
                {
                    isDisabled = true;
                } 
            }
           
            this.unit = unit;
            this.isSelected = isSelected;
        } 
    }


    /**
    * This is the method which start game if selected 2 records.Else will display error mesage
    * @see Game
    * @return Null
    */
    public PageReference gameStart()
    {
        selectedUnitList = new List<Unit__c>();
        for(GameWrapper wrap : unitList)
        {
            if(wrap.isSelected)
                {  
                    selectedUnitList.add(wrap.unit);  
                }  
        }
        if(selectedUnitList.size() == 2)
        {
            Game game = new Game(selectedUnitList.get(0), selectedUnitList.get(1));
            selectPlayers = true;
            deletePlayers = false;
            newPlayer = false;
            gameDescription = true;
            update selectedUnitList;
            selectedUnitList = new List<Unit__c>();
            unitList = getData();
            gameDescriptionList = game.getGameDescriptionList();
        }
        else
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,
                                                        'Please select 2 players!'));
            selectPlayers = true;
            deletePlayers = false;
            newPlayer = false;
            gameDescription = false;
        }
        return null;
    }
}