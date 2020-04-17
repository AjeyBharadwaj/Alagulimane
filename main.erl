-module(helloworld).
-export([start/0]).

-define(MAX_POS, 4).
-define(INIT_VALUES, 1).

print(String) ->
    io:fwrite("~p~n", [String]).

print_new_line() ->
    io:fwrite("~n").

print_board(Board, I) ->
    {_, Val} = lists:nth(I, Board),
    io:fwrite("~p ", [Val]).

for(Board, I, To) ->
    if
    (I == To) ->
        ok;
    true ->
        print_board(Board, I),
        for(Board, I+1, To)
    end.

reverse_for(Board, I, To) ->
    if
    (I == To) ->
        ok;
    true ->
        print_board(Board, I),
        reverse_for(Board, I-1, To)
    end.

print_board(Board) ->
    reverse_for(Board, ?MAX_POS, (?MAX_POS/2)),
    print_new_line(),
    for(Board, 1, (?MAX_POS/2+1)),
    print_new_line().

completed_loop(Board, Pos) ->
    if
    (Pos == (?MAX_POS + 1)) ->
        true;
    true ->
        {_,Value} = lists:nth(Pos, Board),
        if
        (Value == ?INIT_VALUES) ->
            completed_loop(Board, Pos+1);
        true ->
            false
        end
    end.

completed(Board) ->
    completed_loop(Board, 1).

move(Board, Starting_Pos) ->
    Cur_Count = lists:nth(Starting_Pos rem (?MAX_POS + 1), Board),
    print("\nValue : " ++ integer_to_list(Cur_Count)).

loop(Board, Starting_Pos, Iteration_Count) ->
    Is_Completed = completed(Board),
    if
    (Is_Completed == true) and (Iteration_Count =/= 0) ->
        print_board(Board),
        print("Completed : " ++ integer_to_list(Iteration_Count)),
        print_new_line();
    true ->
        print_board(Board),
        print("Not Completed : " ++ integer_to_list(Iteration_Count)),
        print_new_line()
    end.

init_board_loop(Board, I, Value, Max) ->
    if
    (I == Max) ->
        Board;
    true ->
        Tmp_Board = lists:append(Board, [{integer_to_list(I), Value}]),
        init_board_loop(Tmp_Board, I+1, Value, Max)
    end.

init_board() ->
    init_board_loop([], 1, ?INIT_VALUES, ?MAX_POS+1).

start() ->
    Board = init_board(),
    loop(Board, 1, 0).
