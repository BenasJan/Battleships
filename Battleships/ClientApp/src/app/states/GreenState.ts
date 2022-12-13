import {GameStyleState} from "./GameStyleState";
import {WhiteState} from "./WhiteState";
import {YellowState} from "./YellowState";
import {RedState} from "./RedState";

export class GreenState extends GameStyleState {
  changeState(): GameStyleState {
    console.log("Green state active");
    this.context.color = "green";
    this.context.chanceToMiss = 25;
    return this.context.styleState = new YellowState(this.context);
  }
}
