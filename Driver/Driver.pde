Square[][] squares = new Square[ 16 ][ 16 ];
int xCor = 0;
int yCor = 0;

void setup()
{
  background( 0 );
  size( 800, 800 );
  for( int row = 0; row < 16; row++ )
  {
    for( int col = 0; col < 16; col++ )
    {
      squares[ row ][ col ] = new Square();
      squares[ row ][ col ].setXCor( xCor );
      squares[ row ][ col ].setYCor( yCor );
      squares[ row ][ col ].update();
      xCor += 50;
      if( row == 0 && col == 0 )
      {
        if( squares[ row++ ][ col ].state == 1 )
        {
          squares[ row ][ col ].number++;
        }
        if( squares[ row++ ][ col++ ].state == 1 )
        {
          squares[ row ][ col ].number++;
        }
        if( squares[ row ][ col-- ].state == 1 )
        {
          squares[ row ][ col ].number++;
        }
      }
      if( row == 0 && col == 15 )
      {
        if( squares[ row++ ][ col ].state == 1 )
        {
          squares[ row ][ col ].number++;
        }
        if( squares[ row++ ][ col++ ].state == 1 )
        {
          squares[ row ][ col ].number++;
        }
        if( squares[ row ][ col-- ].state == 1 )
        {
          squares[ row ][ col ].number++;
        }
      }
      
    }
    xCor = 0;
    yCor += 50;
  }
}