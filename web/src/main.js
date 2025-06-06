// importing the Vue library
import { createApp } from "vue";

// importing the Pinia state management library
import { createPinia } from "pinia";

// importing the style.css file for global styles
import "./style.css";

// importing the App.vue component
import App from "./App.vue";

const app = createApp(App);

app.use(createPinia());

app.mount("#app");
