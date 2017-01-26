import 'block.dart';
import 'package:stagexl/stagexl.dart';

class Block {
  Block(num width, num height){
    //this.width = width;
    //this.height = height;
  }
  List<Bitmap> displayObjects = [];
  get position => position;
  set position (List<num> position) => position;
  get x => position[0]; set x (num x) => x;
  get y => position[1]; set y (num y) => y;
  get width => width; set width (num width) => width;
  get height => height; set height (num height) => height;
}

class Stack {
  List<Block> blocks;
  append(Block block){
    blocks.add(block);
  }
  stackBlocks(){
    for (var i = 1; i < blocks.length; i++) {
      Block prevBlock = blocks[i - 1];
      Block currentBlock = blocks[i];
      currentBlock.y = prevBlock.y + prevBlock.height;

      currentBlock.displayObjects.forEach((Bitmap displayObj) => //{
        print(displayObj.height));
        //displayObj.x = 10;//displayObj.x += currentBlock.x;
      //});
    }
  }
}