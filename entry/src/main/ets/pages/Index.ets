import Horse from'../View/Horse'
//import { text } from '@kit.ArkGraphics2D';


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State Width: number=0
  @State Height: number = 0
  //@State space:number[][]=[]
  @State length:number=7
  @State width_:number=80/7
  @State height_:number=100/7
  @State judge:boolean=true
  @State space: number[][] = new Array(7).fill(0).map(() => new Array(7).fill(0));
  build() {
    Row(){

      Flex({ wrap: FlexWrap.Wrap}){
        ForEach(this.space,(row:number[])=>{
          ForEach(row,(element:Number)=>{

            Text(`${element}`)
              //.width("this.length`%`")
              .width(`${this.height_.toString()}%`)
              .height(`${this.width_}%`)
          })
        })
      }
      .height('100%')
      .width('80%')
      .backgroundColor(Color.Orange)
      Column(){
        TextInput({placeholder:'请输入纵坐标'})
          .onChange((hit)=>{
            this.Height=Number(hit)
            console.log('+',this.Height)
          })
        TextInput({placeholder:'请输入横坐标'})
          .onChange((wid)=>{
            this.Width=Number(wid)
            console.log('+',this.Width)
          })
        TextInput({placeholder:'请输入长度'})
          .onChange((len)=>{
            this.length=Number(len)
            console.log('+',this.length)
            this.space=new Array(this.length).fill(0).map(() => new Array(this.length).fill(0))
            this.width_=80/this.length
            this.height_=100/this.length
          })
         Button('运行',{type:ButtonType.Capsule, stateEffect: true})
          .backgroundColor(0x317aff)
          .width(90)
          .height(40)
          .onClick(()=>{
            let horse=new Horse(this.length,this.space);
            if(horse.solve(this.Height,this.Width)){
              horse.printBoard()
              this.judge=true
            }
            else {
              this.judge=false
              console.log('this.sapce:',this.space)
            }

          })
        Text(this.judge?'True':'False')
      }
      .height('100%')
      .width('20%')
    }
    .height('100%')
    .width('100%')
  }
}