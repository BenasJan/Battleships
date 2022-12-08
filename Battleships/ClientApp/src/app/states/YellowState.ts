import {GameStyleState} from "./GameStyleState";
import {WhiteState} from "./WhiteState";

export class YellowState extends GameStyleState {
  changeColor(): GameStyleState {
    console.log("Yellow state active");
    this.context.color = "yellow";
    return new WhiteState(this.context);
  }
}
