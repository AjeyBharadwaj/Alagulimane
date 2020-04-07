import sys

Board = []

MAX_POS = 2
INIT_VALUE = 1 

def init_board():
    for i in range(0, MAX_POS):
        Board.append(INIT_VALUE)

def print_board(Iteration_Count):
    print("Iteration_Count : " + str(Iteration_Count))

    print("    ", end="")
    for i in range(MAX_POS-1, int(MAX_POS/2)-1, -1):
        print(Board[i], end = " ")

    print()
    print("    ", end = "")
    for i in range(0, int(MAX_POS/2)):
        print(Board[i], end = " ")
    print()

def is_done():
    for i in range(0, MAX_POS):
        if (Board[i] is not INIT_VALUE):
            return False

if __name__ == "__main__":
    if len(sys.argv) is not 3:
        print("FORMAT : python3 main.py MAX_POS INIT_VALUE")
        sys.exit(-1) 

    MAX_POS = int(sys.argv[1])
    INIT_VALUE = int(sys.argv[2])

    init_board()
    Starting_Pos = 0
    Done = False
    Iteration_Count = 0 
    
    while (Done == False):
        Iteration_Count = Iteration_Count + 1
        Coins = Board[Starting_Pos]
        Board[Starting_Pos] = 0
        
        for i in range(0, Coins):
            Board[(Starting_Pos+i+1)%MAX_POS] = Board[(Starting_Pos+i+1)%MAX_POS] +1
    
        #print_board(Iteration_Count)
        Starting_Pos = (Starting_Pos + Coins + 1)%MAX_POS
    
        Done = is_done()
    
        #input()

    print("In Alugulimane with {} Postions and {} Initial Coins, it takes {} turns to arrive at initial position".format(MAX_POS, INIT_VALUE, Iteration_Count))

