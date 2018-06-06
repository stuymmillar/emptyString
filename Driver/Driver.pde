Square[][] squares = new Square[ 16 ][ 16 ];
int xCor = 0;
int yCor = 0;

void setup()
{
  background( 0 );
  size( 800, 800 );
  for( int row = 0; row < 16; row++ ) // Set up squares
  {
    for( int col = 0; col < 16; col++ )
    {
      squares[ row ][ col ] = new Square();
      squares[ row ][ col ].setXCor( xCor );
      squares[ row ][ col ].setYCor( yCor );
      squares[ row ][ col ].update1();
      xCor += 50;
    }
    xCor = 0;
    yCor += 50;
  }
  for( int row = 0; row < 16; row++ ) // Get adjacent mines
  { 
    for( int col = 0; col < 16; col++ ) 
    { 
      for( int rowOffs = -1; rowOffs <= 1; rowOffs++ ) 
      {
        for( int colOffs = -1; colOffs <= 1; colOffs++ ) 
        {
          int posX = row + rowOffs;
          int posY = col + colOffs;
          if( posX != -1 && posY != -1 && posX != 16 && posY != 16 )
          {
            if( squares[ posX ][ posY ].state == 1 )
            {
              squares[ row ][ col ].number++;
            }
          }
        }
      }
    }
  }
  for( int row = 0; row < 16; row++ )
  {
    for( int col = 0; col < 16; col++ )
    {
      squares[ row ][ col ].update2();
    }
  }
} // end setup()
