Square[] squares = new Square[ 256 ];
int xCor = 0;
int yCor = 0;

void setup()
{
  background( 0 );
  size( 800, 800 );
  for( int i = 0; i < 256; i++ )
  {
    for( int x = 0; x < 16; x++ )
    {
      for( int y = 0; y < 16; y++ )
      {
        squares[ i ] = new Square();
        squares[ i ].setXCor( xCor );
        squares[ i ].setYCor( yCor );
        squares[ i ].update();
        yCor += 50;
      }
      yCor = 0;
      xCor += 50;
    }
  }
}
