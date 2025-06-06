import { DefaultData } from "@/store/index";
import { FetchNUI } from "@/utils";
import { storeToRefs } from "pinia";

export default function () {
  const StoreData = DefaultData();
  const { } = storeToRefs(StoreData);

  window.addEventListener("message", async ({ data }) => {
    switch (data.action) {
      case 'OPEN_NUI':
        document.getElementById('#main').style.display = 'flex';
        break;
      case 'CHECK_NUI':
        FetchNUI('NUI_READY', {})
        break;
      default:
        break;
    }
  });
}