<script setup lang="ts">
import { ref } from 'vue'
import sounds  from '../assets/sounds.json';

defineProps<{ msg: string }>()

const soundElements = sounds.map((sound) => {
  return {
    ...sound,
    element: new Audio(sound.url),
  };
})

const playSound = ( sound: {
  url: string,
  title: string,
  element: HTMLAudioElement,
} ) => {

  sound.element.play();
}

</script>

<template>
  <h1>Ben's Sound Board</h1>
  <div class="container">
    <ul class="sound-list">
      <li v-for="sound in soundElements">
        <button @click="playSound(sound)">{{sound.title}}</button>
      </li>
    </ul>
  </div>
</template>

<style scoped>
.container{
  display: block;
  width: auto;
  max-width: 1200px;
  margin: 0 auto 0 auto;
}

ul{
  list-style: none;
  display: flex;
}

li {
  justify-content: space-between;
  flex-direction: row;
  flex-grow: 1;
}

button {
  width: 200px;
  height: 200px;
  color: #fff;
  background-color: #42b983;
}
a {
  color: #42b983;
}

</style>
