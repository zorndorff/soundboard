<script setup lang="ts">
import sounds  from '../assets/sounds.json';

defineProps<{ msg: string }>()

const soundElements = sounds.map((sound) => {
  return {
    ...sound,
    playing: false,
    element: new Audio(sound.url),
  };
})

const playSound = ( sound: {
  url: string,
  title: string,
  playing: boolean,
  element: HTMLAudioElement,
} ) => {

  sound.playing = true;

  sound.element.addEventListener('ended', () => {
    sound.playing = false;
  });

  sound.element.play();
}

</script>

<template>
  <h1>Ben's Sound Board</h1>
  <div class="container">
    <ul class="sound-list">
      <li v-for="sound in soundElements" :key="sound.url">
        <button @click="playSound(sound)" :class="{ playing: sound.playing }">{{sound.title}}</button>
      </li>
    </ul>
  </div>
</template>

<style scoped>
.container{
  display: block;
  width: 100%;
  max-width: 1200px;
  margin: 0 auto 0 auto;
}

ul{
  list-style: none;
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  margin: 0;
  padding: 0;
}

li {
  justify-content: space-between;
  flex-grow: 1;
  padding: 10px;
}

button {
  width: 100px;
  height: 100px;
  color: #fff;
  background-color: #42b983;
}

a {
  color: #42b983;
}

</style>
