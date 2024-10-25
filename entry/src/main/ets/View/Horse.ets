export default class Horse {
  private board: number[][];
  private moves: number[][];
  private size: number;
  private hor: number[][];
  //private border: number;

  constructor(size: number, hor: number[][]) {
    this.size = size;
    this.hor = hor
    //this.border=border
    this.board = new Array(this.size).fill(0).map(() => new Array(this.size).fill(-1));
    console.log('ddd'+this.board)
    this.moves = [
      [2, 1], [1, 2], [-1, 2], [-2, 1],
      [-2, -1], [-1, -2], [1, -2], [2, -1]
    ];
  }

  public solve(startX: number, startY: number): boolean {
    this.board[startX][startY] = 0; // 设置起始位置
    return this.tour(startX, startY, 1);
  }

  private tour(x: number, y: number, stepCount: number): boolean {
    if (stepCount === this.size * this.size) {
      return true; // 成功走完所有格子
    }

    for (let i = 0; i < this.moves.length; i++) {
      const dx = this.moves[i][0]; // 获取 x 方向的移动
      const dy = this.moves[i][1]; // 获取 y 方向的移动
      const newX = x + dx;
      const newY = y + dy;

      if (this.isValidMove(newX, newY)) {
        this.board[newX][newY] = stepCount; // 标记当前步数
        if (this.tour(newX, newY, stepCount + 1)) {
          return true; // 如果能继续走，返回 true
        }
        this.board[newX][newY] = -1; // 回溯
      }
    }
    return false; // 没有可走的路径
  }

  private isValidMove(x: number, y: number): boolean {
    return x >= 0 && x < this.size && y >= 0 && y < this.size && this.board[x][y] === -1;
  }

  public printBoard(): void {
    for (let i = 0; i < 7; i++) {
      for (let j = 0; j < 7; j++) {
        this.hor[i][j] = this.board[i][j]
        console.log('ddd'+this.board[i][j]);
      }
    }
  }
}
 // const Horse = new horse(8)
 // export default Horse as horse

