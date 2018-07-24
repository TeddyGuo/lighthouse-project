"""
The following one is used to 
stop the verbose details when the users redefine O1, O2, X1, X2
"""

$VERBOSE = nil

class String
	def is_i
		return self.to_i.to_s == self
	end
end

# print out the board
def print_board(board)
        for i in 0...3
                print " "
                for j in 0...2
                        print board[i][j], " | "
                end
                print board[i][2], "\n"

                if i != 2
                        puts "-----------"
                end
        end
end

# check who the winner is
def check(board)
	for i in 0...3
		if (board[i][0] == "O" && board[i][1] == "O" && board[i][2] == "O") || (board[0][i] == "O" && board[1][i] == "O" && board[2][i] == "O")
			return "O"
		elsif (board[i][0] == "X" && board[i][1] == "X" && board[i][2] == "X") || (board[0][i] == "X" && board[1][i] == "X" && board[2][i] == "X")
			return "X"
		end
	end

	if (board[0][0] == "O" && board[1][1] == "O" && board[2][2] == "O") || (board[0][2] == "O" && board[1][1] == "O" && board[2][0] == "O")
		return "O"
	elsif (board[0][0] == "X" && board[1][1] == "X" && board[2][2] == "X") || (board[0][2] == "X" && board[1][1] == "X" && board[2][0] == "X")
		return "X"
	end

	return ""
end

def play(round, board)

	@symbol = ""

	if round % 2 == 0
		@symbol = "X"
	else
		@symbol = "O"
	end

        flag = 0
        while flag == 0
        print "請選出你要下棋的位置", "\n"
        print "請輸入代表列的數字[range 1-3]："
        @in1 = gets.chomp
        print "請輸入代表欄的數字[range 1-3]："
        @in2 = gets.chomp
        # if-stmt-judge
        if @in1.is_i && @in1.to_i > 0 && @in2.to_i <= 3 && @in2.is_i && @in2.to_i > 0 && @in2.to_i <= 3
                if board[@in1.to_i - 1][@in2.to_i - 1] == " "
                        board[@in1.to_i - 1][@in2.to_i - 1] = @symbol
                        flag = 1
                else
                        print "請重新輸入，這裡已經有記號了！", "\n"
                end
        else
                print "請重新輸入，你在亂輸入什麼？", "\n"
        end
        end

        print_board(board)
        out = check(board)
        if out != ""
                puts "#{out} 是真正的贏家，恭喜 #{out} !!!"
                return "end"
        end
	# keep playing
	return ""
end

# default start signal is one
$start = 1

while $start == 1

# the board
@board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
# record the round of the game
@round = 0

print "你開啟了一局新的井字遊戲！", "\n"
print "請以 1-3 數字對應棋盤的列與欄", "\n"
print_board(@board);

while true
	# O 的play
	@round += 1

	print "第#{@round}回合，輪到Ｏ", "\n"	

	if play(@round, @board) == "end"
		break
	end

	# check the round whether it is nine or not
	if @round == 9
		puts "和局，慢走不送（＊＊）/"
		break
	end

	# X 的play
	@round += 1

	print "第#{@round}回合，輪到Ｘ", "\n"

	if play(@round, @board) == "end"
		break
	end
end

print "你們想開啟新的一局嗎？[y/n] "
@keep = gets.chomp

if @keep == "y" || @keep ==  "Y"
	$start = 1
else 
	$start = 0
end

end

puts "謝謝您們的遊玩，祝您們有美好的一天"
