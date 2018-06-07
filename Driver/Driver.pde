Square[][] squares = new Square[ 16 ][ 16 ];
int xCor = 0;
int yCor = 0;
boolean gameOver = false;
boolean reveal = false;
boolean flag = false;
boolean loop = false;
int firstClick = 0;

void setup()
{
  background( 0 );
  size( 800, 800 );
  // Sets up board
  for( int row = 0; row < 16; row++ )
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
  // Gets adjacent mines for all safe squares
  for( int row = 0; row < 16; row++ )
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
} // end setup()

void mouseClicked()
{
  if( mouseButton == LEFT )
  {
    if( firstClick == 0 )
    {
      firstClick = 1;
      reveal = true;
    }
    else
    {
      reveal = true;
    }
  }
  else if( mouseButton == RIGHT )
  { //<>//
    flag = true;
  }
}

void draw()
{
  if( gameOver == true )
  {
    
  }
  if( reveal == true )
  { 
    // Constantly track mouse location relative to squares
    for( int row = 0; row < 16; row++ )
    {
      for( int col = 0; col < 16; col++ )
      {
        if( ( mouseX >= squares[ row ][ col ].xCor ) &&
            ( mouseY >= squares[ row ][ col ].yCor ) &&
            ( mouseX <= squares[ row ][ col ].xCor + 50 ) &&
            ( mouseY <= squares[ row ][ col ].yCor + 50 ) &&
            ( squares[ row ][ col ].isClicked == false ) &&
            ( squares[ row ][ col ].isFlagged == false ) )
        { 
          // Considers if first click is on a mine square
          if( firstClick == 1 && squares[ row ][ col ].state == 1 )
          {
            firstClickMine( row, col );
            firstClick = -1;
          }
          else
          {
            firstClick = -1;
          }
          squares[ row ][ col ].update2();
          if( squares[ row ][ col ].state == 1 )
          {
            for( int r = 0; r < 16; r++ )
            {
              for( int c = 0; c < 16; c++ )
              {
                if( squares[ r ][ c ].isClicked == false )
                {
                  squares[ r ][ c ].update2();
                }
              }
            }
            gameOver = true;
          }
          else if( squares[ row ][ col ].number == 0 )
          {
            recurse( row, col );
          }
        }
      }
    }
  }
  if( flag == true )
  {
    for( int row = 0; row < 16; row++ )
    {
      for( int col = 0; col < 16; col++ )
      {
        if( ( mouseX >= squares[ row ][ col ].xCor ) &&
            ( mouseY >= squares[ row ][ col ].yCor ) &&
            ( mouseX <= squares[ row ][ col ].xCor + 50 ) &&
            ( mouseY <= squares[ row ][ col ].yCor + 50 ) &&
            ( squares[ row ][ col ].isClicked == false ) )
        {
          if( squares[ row ][ col ].isFlagged == false )
          {
            squares[ row ][ col ].placeFlag();
          }
          else
          {
            rect( squares[ row ][ col ].xCor, squares[ row ][ col ].yCor, 50, 50 );
            squares[ row ][ col ].isFlagged = false;
          }
        }
      }
    }
  }
  reveal = false;
  flag = false;
}

public void recurse( int row, int col )
{
  if( squares[ row ][ col ].state == 1)
  {
    return;
  }
  else if( squares[ row ][ col ].number != 0 )
  {
    squares[ row ][ col ].update2();
    return;
  }
  else
  {
    for( int rowOffs = -1; rowOffs <= 1; rowOffs++ ) 
    {
      for( int colOffs = -1; colOffs <= 1; colOffs++ ) 
      {
        int posX = row + rowOffs;
        int posY = col + colOffs;
        if( posX != -1 && posY != -1 && posX != 16 && posY != 16 )
        {
          if( squares[ posX ][ posY ].isClicked == false )
          {
            squares[ posX ][ posY ].update2();
            recurse( posX, posY );
          }
        }
      }
    }
  }
}

public void firstClickMine( int x, int y )
{
  // Remove mine and change to safe square
  squares[ x ][ y ].setState( 0 );
  // Get adjacent mines for changed square
  squares[ x ][ y ].setNumber( 0 );
  for( int rowOffs = -1; rowOffs <= 1; rowOffs++ ) 
  {
    for( int colOffs = -1; colOffs <= 1; colOffs++ ) 
    {
      int posX = x + rowOffs;
      int posY = y + colOffs;
      if( posX != -1 && posY != -1 && posX != 16 && posY != 16 )
      {
        if( squares[ posX ][ posY ].state == 0 )
        {
          // Minus one number off neighboring square of changed square
          squares[ posX ][ posY ].setNumber( squares[ posX ][ posY ].number - 1 );
        }
        if( squares[ posX ][ posY ].state == 1 )
        {
          // Sets number of adjacent mines for changed square
          squares[ x ][ y ].number++;
        }
      }
    }
  }
  // Place removed mine at upper left corner
  boolean placed = false;
  // If there already is a mine, go through board until a safe square is found
  for( int i = 0; i < 16; i++ )
  {
    for( int j = 0; j < 16; j++ )
    {
      if( placed == false && squares[ i ][ j ].state == 0 )
      {
        squares[ i ][ j ].setState( 1 );
        // Change numbers of adjacent safe squares
        for( int rowOffs = -1; rowOffs <= 1; rowOffs++ ) 
        {
          for( int colOffs = -1; colOffs <= 1; colOffs++ ) 
          {
            int posX = i + rowOffs;
            int posY = j + colOffs;
            if( posX != -1 && posY != -1 && posX != 16 && posY != 16 )
            {
              if( squares[ posX ][ posY ].state == 0 )
              {
                squares[ posX ][ posY ].number++;
              }
            }
          }
        }
      }
      placed = true;
    }
  }
}
