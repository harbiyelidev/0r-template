import { defineStore } from "pinia";
import { FetchNUI } from "@/utils";

export const DefaultData = defineStore("DefaultData", {
  state: () => ({
  }),
  actions: {
    // CloseUi()
    // @return {void} - No return value
    // @description - Closes the UI and sends a message to the server to close the UI
    CloseUi() {
      setTimeout(() => {
        FetchNUI("closeUi");
      }, 450);
    },
  },
});
