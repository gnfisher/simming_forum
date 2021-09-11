module.exports = {
  mode: "jit",
  purge: [
    "app/views/**/*.html.erb",
    "app/helpers/**/*.rb",
    "app/packs/**/*.scss",
    "app/packs/**/*.css",
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
