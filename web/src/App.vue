<script setup>
import nuiEvents from './utils/event'
import { FetchNUI } from "@/utils";
import { onMounted } from 'vue';
import { DefaultData } from '@/store/index'
import { storeToRefs } from 'pinia'
import { motion, AnimatePresence } from 'motion-v';

const StoreData = DefaultData();
const { } = storeToRefs(StoreData);

onMounted(() => {
    window.addEventListener('keydown', (event) => {
        if (event.key === 'Escape') {
            document.getElementById('main').style.display = 'none';
            FetchNUI('CLOSE_UI', {});
        };
    });

    nuiEvents();
});
</script>

<template>
    <div id="main" class="w-[100vw] h-[100vh] items-center justify-center overflow-hidden relative" style="display: none;">
    </div>
</template>