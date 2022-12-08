import {GameStyleState} from "./GameStyleState";
import {RedState} from "./RedState";

export class WhiteState extends GameStyleState {
  changeColor(): GameStyleState {
    console.log("White state active");

    this.context.color = "white";
    return new RedState(this.context);
  }
}
