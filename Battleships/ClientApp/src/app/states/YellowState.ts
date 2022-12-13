import {GameStyleState} from "./GameStyleState";
import {WhiteState} from "./WhiteState";
import {RedState} from "./RedState";

export class YellowState extends GameStyleState {
  changeState(): GameStyleState {
    console.log("Yellow state active");
    this.context.color = "yellow";
    this.context.chanceToMiss = 0;
    return this.context.styleState = new WhiteState(this.context);
  }
}
