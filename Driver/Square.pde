class Square{
  final int SAFE = 0;
  final int MINE = 1;
  private float status = random( 0, 10 );
  private int xCor;
  private int yCor;
  private int state;
  private int number;
  private boolean isClicked;
 
  public Square()
  {
    xCor = 0;
    yCor = 0;
    isClicked = false;
    if( status <= 1 )
    {
      state = MINE;
    }
    else
    {
      state = SAFE;
    }
  }
  
  public void update()
  {
    rect( xCor, yCor, 50, 50 );
    if( state == MINE )
    {
      PImage img = loadImage( "Mine.jpg" );
      image( img, xCor, yCor );
    }
  }
  
  public void setXCor( int newCor )
  {
    xCor = newCor;
  }
  
  public void setYCor( int newCor )
  {
    yCor = newCor;
  }
  
  public void reveal()
  {
    isClicked = true;
  }
  
}