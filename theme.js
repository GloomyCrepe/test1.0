import theme from 'mdx-deck/themes'

const white = '#fffceb'
const black = '#351e38'
const blue = '#2d5dd7'

export default {
  ...theme,
  font: 'Roboto, sans-serif',
  fontSizes: [
    '0.75em', '1em', '1em', '2em', '5em'
  ],
  colors: {
    text: black,
    background: white,
    link: blue
  }
}
