<template>
  <p>{{ greeting }} World! I'm Vue component :)</p>
</template>

<script>
export default {
  name: 'HelloWorld',
  data() {
    return {
      greeting: "Hello"
    };
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>