import {GameStyleState} from "./GameStyleState";
import {WhiteState} from "./WhiteState";
import {YellowState} from "./YellowState";

export class GreenState extends GameStyleState {
  changeColor(): GameStyleState {
    console.log("Green state active");
    this.context.color = "green";
    return new YellowState(this.context);
  }
}
