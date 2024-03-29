//+------------------------------------------------------------------+
//|                    CREATED BY EXUCEST                            |
//|                  Verified By Fusion Market                       |
//|                 Copyright © 2023 by EXUCEST                      |
//|                     All Rights Reserved                          |
//+------------------------------------------------------------------+

#property copyright "Copyright © 2023 by EXUCEST"
#property link      "https://www.exucest.com"
#property version   "9.0"
#property description "THIS IS AN EXHUSTIVE EA verified by fusion maket"
#property strict
//+------------------------------------------------------------------+
//|                        INPUT TRADING PARAMETERS                  |
//+------------------------------------------------------------------+

extern double SL = 10;  // Stop loss value in pips
extern double TP = 40;  // Take profit value in pips
extern double PTP = 30;  // Partial Profit ( TP1 )
extern double LOT=0.35;   // Position Size
extern double LOT2 = 0.25; // Partial Lot
extern double BP=5.00;// Border Area

//Fixed Trading Parameters
int NumberofLong = 0;
int NumberofShort = 0;

int Slippage = 5; // Set your desired slippage value (in points)

double TralingStop = 0.0035;
double TralingPrice = 0.0045;
double MaxSpread = 0.00004; // Maxium Spread


//+------------------------------------------------------------------+
//|          INPUT CUSTOM ENTRY PRICE FROM EA SETTING                |
//+------------------------------------------------------------------+



   
extern double EP1=0.0000;
extern double EP2=0.0000;
extern double EP3=0.0000;
extern double EP4=0.0000;
extern double EP5=0.0000;
extern double EP6=0.0000;
extern double EP7=0.0000;
extern double EP8=0.0000;
extern double EP9=0.0000;
extern double EP10=0.0000;
extern double EP11=0.0000;
extern double EP12=0.0000;
extern double EP13=0.0000;
extern double EP14=0.0000;
extern double EP15=0.0000;
extern double EP16=0.0000;
extern double EP17=0.0000;
extern double EP18=0.0000;
extern double EP19=0.0000;
extern double EP20=0.0000;

//+------------------------------------------------------------------+
//|                    DECLEAR AS GLOBAL VARIABLE                    |
//+------------------------------------------------------------------+

// Declear Should Prevent Long Position
bool shouldPreventLongPosition = false; // Global variable declaration

// Declear Should Prevent Short Position
bool shouldPreventShortPosition = false; // Declare the variable

double askPrice = MarketInfo(Symbol(), MODE_ASK);
double bidPrice = MarketInfo(Symbol(), MODE_BID);




// Declare a global array to track entry prices where short positions are opened
double openedEntryPrices[20] = {0};

double partialTP;
double partialLot;
double takeProfit;
double stopLoss;
double lotSize;
double borderArea;
double TP1price;

//MAKE CUSTOM ENTRY PRICE TO GLOBAL VARIABLE
double entryPrice[20];

//CHECK EXISTING POSITION
bool isShortPositionExists = false;



// Rest of the Expert Advisor code...




//+------------------------------------------------------------------+
//|                  INSTALL ALL VARIABLE HERE                       |
//+------------------------------------------------------------------+
int OnInit()
   {
    //ASSIGN TRADING PARAMETERS
    stopLoss = SL/10000;
    partialTP = PTP/10000;
    takeProfit = TP/10000;
    lotSize = LOT;
    partialLot = LOT2;
    borderArea = 1/10000.0;
    
   
   
 {
  //ASSIGN CUSTOM ENTRY PRICES TO GLOBAL VARIABLE
   entryPrice[0] = EP1;
   entryPrice[1] = EP2;
   entryPrice[2] = EP3;
   entryPrice[3] = EP4;
   entryPrice[4] = EP5;
   entryPrice[5] = EP6;
   entryPrice[6] = EP7;
   entryPrice[7] = EP8;
   entryPrice[8] = EP9;
   entryPrice[9] = EP10;
   entryPrice[10] = EP11;
   entryPrice[11] = EP12;
   entryPrice[12] = EP13;
   entryPrice[13] = EP14;
   entryPrice[14] = EP15;
   entryPrice[15] = EP16;
   entryPrice[16] = EP17;
   entryPrice[17] = EP18;
   entryPrice[18] = EP19;
   entryPrice[19] = EP20;

   return(INIT_SUCCEEDED);
  }
  }
//+------------------------------------------------------------------+
//|                    LONG POSITION FUNCTION                       |
//+------------------------------------------------------------------+

void longPosition(double entryPrice, double stopLoss, double takeProfit, double lotSize)
{
    double priceDifference = 0.0001; // Adjust the multiplier as needed

    for (int i = 0; i < 20; i++)
    {
        // Check if current ask price is within the range
        if (Ask == entryPrice && Ask <= entryPrice + priceDifference)
        {
            // Execute long position
            double stopLossLevel = entryPrice - stopLoss;
            double takeProfitLevel = entryPrice + takeProfit;

            int ticket = OrderSend(Symbol(), OP_BUY, lotSize, Ask, Slippage, stopLossLevel, takeProfitLevel, "Long Position", 0, 0, Green);

            if (ticket > 0)
            {
                // Order placed successfully
                Print("Long Position executed with ticket: ", ticket);

                // Exit the loop after executing the long position
                break;
            }
            else
            {
                // Order placement failed, handle the error
                int error = GetLastError();
                Print("Error placing Long Position: ", error);

                // Optionally, add a delay or retry logic here
                // Delay for a while and retry, if needed
                Sleep(1000); // Sleep for 1 second (adjust as needed)
            }
        }
    }
}

//+------------------------------------------------------------------+
//|                    LONG POSITION FUNCTION    2                   |
//+------------------------------------------------------------------+

void longPosition2(double entryPrice, double stopLoss, double takeProfit, double lotSize)
{
    double priceDifference = 0.0001; // Adjust the multiplier as needed

    for (int i = 0; i < 20; i++)
    {
        // Check if current ask price is within the range
        if (Ask == entryPrice && Ask <= entryPrice + priceDifference)
        {
            // Execute long position
            double stopLossLevel = entryPrice - stopLoss;
            double takeProfitLevel = entryPrice + partialTP;

            int ticket = OrderSend(Symbol(), OP_BUY, partialLot, Ask, Slippage, stopLossLevel, takeProfitLevel, "Long Position", 0, 0, Green);

            if (ticket > 0)
            {
                // Order placed successfully
                Print("Long Position executed with ticket: ", ticket);

                // Exit the loop after executing the long position
                break;
            }
            else
            {
                // Order placement failed, handle the error
                int error = GetLastError();
                Print("Error placing Long Position: ", error);

                // Optionally, add a delay or retry logic here
                // Delay for a while and retry, if needed
                Sleep(1000); // Sleep for 1 second (adjust as needed)
            }
        }
    }
}


//+------------------------------------------------------------------+
//|                    SHORT POSITION FUNCTION      2                |
//+------------------------------------------------------------------+
void shortPosition2(double entryPrice, double stopLoss, double takeProfit, double lotSize)
{
    double priceDifference = MarketInfo(Symbol(), MODE_POINT) * 10; // Adjust the multiplier as needed

    for (int i = 0; i < 20; i++)
    {
        // Check if current ask price is within the range
        if (Bid == entryPrice && Bid <= entryPrice + priceDifference)
        {
            // Execute short position
            double stopLoss = entryPrice + stopLoss;
            double takeProfit = entryPrice - partialTP;

            int ticket = OrderSend(Symbol(), OP_SELL, partialLot, Bid, Slippage, stopLoss, takeProfit, "Short Position", 0, 0, Red);

            if (ticket > 0)
            {
                // Order placed successfully
                Print("Short Position executed with ticket: ", ticket);

                // Exit the loop after executing the long position
                break;
            }
            else
            {
                // Order placement failed, handle the error
                int error = GetLastError();
                Print("Error placing Short Position: ", error);

                // Optionally, add a delay or retry logic here
                // Delay for a while and retry, if needed
                Sleep(1000); // Sleep for 1 second (adjust as needed)
            }
        }
    }
}




//+------------------------------------------------------------------+
//|                    SHORT POSITION FUNCTION                       |
//+------------------------------------------------------------------+
void shortPosition(double entryPrice, double stopLoss, double takeProfit, double lotSize)
{
    double priceDifference = MarketInfo(Symbol(), MODE_POINT) * 10; // Adjust the multiplier as needed

    for (int i = 0; i < 20; i++)
    {
        // Check if current ask price is within the range
        if (Bid == entryPrice && Bid <= entryPrice + priceDifference)
        {
            // Execute short position
            double stopLoss = entryPrice + stopLoss;
            double takeProfit = entryPrice - takeProfit;

            int ticket = OrderSend(Symbol(), OP_SELL, lotSize, Bid, Slippage, stopLoss, takeProfit, "Short Position", 0, 0, Red);

            if (ticket > 0)
            {
                // Order placed successfully
                Print("Short Position executed with ticket: ", ticket);

                // Exit the loop after executing the long position
                break;
            }
            else
            {
                // Order placement failed, handle the error
                int error = GetLastError();
                Print("Error placing Short Position: ", error);

                // Optionally, add a delay or retry logic here
                // Delay for a while and retry, if needed
                Sleep(1000); // Sleep for 1 second (adjust as needed)
            }
        }
    }
}



//-------------------------------------------------------------------//

void OrderModifyFunction(int ticket)
{
    // Receive Ticket Number
    double TicketNumber = ticket;

    // Now you can work with the TicketNumber as needed
    Print("Received Ticket Number: ", TicketNumber);

    // Perform other actions with the ticket number here
}
void ModifyPosition()
{
    // Loop through all open orders to manage stop losses
    for (int i = 0; i < OrdersTotal(); i++)
    {
        if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
        {
            double openPrice = OrderOpenPrice();
            double desiredStopLossPrice;

            // Check if the order is a buy or sell order
            if (OrderType() == OP_BUY)
            {
                // Calculate the desired stop loss price for buy orders
                double Tprice = openPrice + TralingPrice;
                desiredStopLossPrice = openPrice + TralingStop;

                // Compare the current market price with the desired price level for buy orders
                if (MarketInfo(Symbol(), MODE_BID) >= Tprice)
                {
                    // Modify the stop loss for this buy order
                    OrderModify(OrderTicket(), openPrice, desiredStopLossPrice, OrderTakeProfit(), clrNONE);
                }
            }
            else if (OrderType() == OP_SELL)
            {
                // Calculate the desired stop loss price for sell orders
                double Tprice = openPrice - TralingPrice;
                desiredStopLossPrice = openPrice - TralingStop;

                // Compare the current market price with the desired price level for sell orders
                if (MarketInfo(Symbol(), MODE_ASK) <= Tprice)
                {
                    // Modify the stop loss for this sell order
                    OrderModify(OrderTicket(), openPrice, desiredStopLossPrice, OrderTakeProfit(), clrNONE);
                }
            }
        }
    }
}



//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
// Define the OnTick() function
// Define the OnTick() function
// Define the OnTick() function
void OnTick()
{
    double Spread = MathAbs(askPrice - bidPrice);
    
    double currentSpread = NormalizeDouble(Spread, 5);

  
 {
    // Check if the current bar's open is below each entry price
    for (int i = 0; i < 20; i++)
    {
        if (Open[0] < entryPrice[i] && currentSpread < MaxSpread)
        {
            // Call the CheckAndOpenTrades function with the additional parameters
            CheckAndOpenTradesForShort(entryPrice[i]);
        }
    }
 }
 //_________________

 {
    // chek iff the current bar's open above each entry price
  
    for (int i = 0; i < 20; i++)
    {
        if (Open[0] > entryPrice[i] && currentSpread < MaxSpread)
        {
            // Call the CheckAndOpenTrades function with the additional parameters
            CheckAndOpenTradesForLong(entryPrice[i]);
        }
    }
 }
 //__________
 
 
     ModifyPosition();
 
   




}


// Start function
int start()
{
    // Trading logic
    // ...

    return (0);
}


//+------------------------------------------------------------------+
//|                    SHORT POSITION CONDITION                      |
//+------------------------------------------------------------------+
void CheckAndOpenTradesForShort(double entryPrice)
{
   // Calculate the area boundaries for the entry price
double areaLowerBound = entryPrice - borderArea;
double areaUpperBound = entryPrice + borderArea;

// Check if there are any open trades in the account
bool hasOpenTrades = OrdersTotal() > 0;

// Check if there is a running long position within the specified area
bool hasLongPosition = false;
int longPositionCount = 0;

for (int j = 0; j < OrdersTotal(); j++)
{
    if (OrderSelect(j, SELECT_BY_POS, MODE_TRADES) && OrderType() == OP_BUY)
    {
        double orderOpenPrice = OrderOpenPrice();
        if (orderOpenPrice >= areaLowerBound && orderOpenPrice <= areaUpperBound)
        {
            hasLongPosition = true;
            longPositionCount++;
        }
    }
}



   // Check if there are any short positions in the area
bool hasShortPositionInArea = false;
int shortPositionCount = 0;

for (int j = 0; j < OrdersTotal(); j++)
{
    if (OrderSelect(j, SELECT_BY_POS, MODE_TRADES) && OrderType() == OP_SELL)
    {
        double orderOpenPrice = OrderOpenPrice();
        if (orderOpenPrice >= areaLowerBound && orderOpenPrice <= areaUpperBound)
        {
            hasShortPositionInArea = true;
            shortPositionCount++;
            
        }
    }
}


    // Condition 1: No open position in the area (no short and long)
    if (!hasOpenTrades && !hasShortPositionInArea && !hasLongPosition)
    {
        // Call the short position function
        shortPosition(entryPrice, stopLoss, takeProfit, lotSize);
    }
    // Condition 2: Running long position but no short position in the area
    else if (hasLongPosition && !hasShortPositionInArea)
    {
        // Call the short position function
        shortPosition(entryPrice, stopLoss, takeProfit, lotSize);
    }
    // Condition 2: Running long position but no short position in the area
    else if (shortPositionCount != 2 && shortPositionCount != 3 && shortPositionCount != 4)
    {
        // Call the short position function
        shortPosition2(entryPrice, stopLoss, takeProfit, lotSize);
    }
    
    // Condition 3: Running short and long positions in the area
    else if (longPositionCount == 2 && shortPositionCount == 2)
    {
        // Call the prevent short position function
        preventShortPosition(entryPrice);
    }

    // Rest of your code...
}





//+------------------------------------------------------------------+
//|                    PREVENT  SHORT  POSITION                       |
//+------------------------------------------------------------------+
void preventShortPosition(double entryPrice)
{
    // Calculate the area boundaries for the entry price
    double areaLowerBound = entryPrice - borderArea;
    double areaUpperBound = entryPrice + borderArea;

    // Check if there is a running short position in the area
    bool hasShortPositionInArea = false;
    bool hasShortPositionCount = 0;
    for (int j = 0; j < OrdersTotal(); j++)
    {
        if (OrderSelect(j, SELECT_BY_POS, MODE_TRADES) && OrderType() == OP_SELL)
        {
            double orderOpenPrice = OrderOpenPrice();
            if (orderOpenPrice >= areaLowerBound && orderOpenPrice <= areaUpperBound)
            {
                hasShortPositionInArea = true;
                hasShortPositionCount++;
                break;
            }
        }
    }

    // If a running short position is found in the area, set the flag to prevent opening new short positions
    if (hasShortPositionInArea && hasShortPositionCount == 2)
    {
      bool  shouldPreventShortPosition = true;
    }
    else
    {
      bool  shouldPreventShortPosition = false;
    }
}


//+------------------------------------------------------------------+
//|                    PREVENT  LONG  POSITION                       |
//+------------------------------------------------------------------+
void preventLongPosition(double entryPrice)
{
    // Calculate the area boundaries for the entry price
    double areaLowerBound = entryPrice - borderArea;
    double areaUpperBound = entryPrice + borderArea;

    // Check if there is a running long position in the area
    bool hasLongPositionInArea = false;
    for (int j = 0; j < OrdersTotal(); j++)
    {
        if (OrderSelect(j, SELECT_BY_POS, MODE_TRADES) && OrderType() == OP_BUY)
        {
            double orderOpenPrice = OrderOpenPrice();
            if (orderOpenPrice >= areaLowerBound && orderOpenPrice <= areaUpperBound)
            {
                hasLongPositionInArea = true;
                break;
            }
        }
    }

    // If a running long position is found in the area, set the flag to prevent opening new long positions
    if (hasLongPositionInArea)
    {
        bool shouldPreventLongPosition = true; // Declare and set the flag to true
        // Use the flag as per your requirements
    }
    else
    {
        bool shouldPreventLongPosition = false; // Declare and set the flag to false
        // Use the flag as per your requirements
    }
}


//+------------------------------------------------------------------+
//|                    LONG  POSITION CONDITION                      |
//+------------------------------------------------------------------+


void CheckAndOpenTradesForLong(double entryPrice)
{
    // Calculate the area boundaries for the entry price
double areaLowerBound = entryPrice - borderArea;
double areaUpperBound = entryPrice + borderArea;

// Check if there are any open trades in the account
bool hasOpenTrades = OrdersTotal() > 0;

// Check if there is a running long position within the specified area
bool hasLongPosition = false;
int longPositionCount = 0;

for (int j = 0; j < OrdersTotal(); j++)
{
    if (OrderSelect(j, SELECT_BY_POS, MODE_TRADES) && OrderType() == OP_BUY)
    {
        double orderOpenPrice = OrderOpenPrice();
        if (orderOpenPrice >= areaLowerBound && orderOpenPrice <= areaUpperBound)
        {
            hasLongPosition = true;
            longPositionCount++;
        }
    }
}



   // Check if there are any short positions in the area
bool hasShortPositionInArea = false;
int shortPositionCount = 0;

for (int j = 0; j < OrdersTotal(); j++)
{
    if (OrderSelect(j, SELECT_BY_POS, MODE_TRADES) && OrderType() == OP_SELL)
    {
        double orderOpenPrice = OrderOpenPrice();
        if (orderOpenPrice >= areaLowerBound && orderOpenPrice <= areaUpperBound)
        {
            hasShortPositionInArea = true;
            shortPositionCount++;
        }
    }
}



   
    // Check the conditions and call the appropriate function
    if (!hasShortPositionInArea && !hasLongPosition )
    {
        // No open positions in the area, call the longPosition function
        longPosition(entryPrice, stopLoss, takeProfit, lotSize);
    }
    else if (hasShortPositionInArea && !hasLongPosition)
    {
        // Running short position found and no running long position, call the longPosition function
        longPosition(entryPrice, stopLoss, takeProfit, lotSize);
    }
    else if (longPositionCount != 2 && longPositionCount != 3 && longPositionCount !=4)
    {
        // Running short position found and no running long position, call the longPosition function
        longPosition2(entryPrice, stopLoss, takeProfit, lotSize);
    }
    
    else if (longPositionCount == 2 && shortPositionCount == 2)
    {
        // Running short and long positions found, call the preventFunction
        preventLongPosition(entryPrice);
    }

    // Rest of your code...
}











//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---ADVANCE NINE FUSION MARKET VERIFIED
//---ADVANCE NINE BLUEBERRY MARKET VERIFIED
   
  }
  
  