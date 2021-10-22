module.exports = {
  mode: "jit",
  purge: [
    "app/views/**/*.html.erb",
    "app/helpers/**/*.rb",
    "app/javascript/**/*.scss",
    "app/assets/stylesheets/**/*.css",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
