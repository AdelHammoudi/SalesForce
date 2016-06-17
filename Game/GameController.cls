/**
 * GameController is a controller of TheGame VF page. 
 * 
 * @author  Adel Hammoudi
 * @version 1.0, June 2016
 */
public class GameController 
{
    public Unit unit1 {get;set;}
    public Unit unit2 {get;set;}
  
    public Game game{get;set;}
    public boolean isGameStart{get;set;}
    
    public GameController()
    {
        unit1 = new Unit();
        unit2 = new Unit();
    }
    
    public PageReference gameStart()
    {
        game = new Game(unit1, unit2);
        isGameStart = true;
        return null;
    }


}