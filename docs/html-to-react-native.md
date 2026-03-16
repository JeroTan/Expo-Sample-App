# HTML → React Native Cheat Sheet

Purpose: quick reference mapping common HTML tags/behaviors to React Native equivalents and notes for developing with Expo.

## Structure & Layout

- `<div>` → `View` (Flexbox container)
- `<span>` → `Text` (inline) or nested `Text`
- Semantic tags (`<main>`, `<section>`, `<header>`) → `View` + `accessibilityRole` when needed
- `<nav>` → navigation components (react-navigation / expo-router)

## Text & Typography

- `<p>` → `Text` (use styles for spacing)
- `<h1>-<h6>` → `Text` with style variants / Heading component
- `<strong>/<b>` → `<Text style={{ fontWeight: 'bold' }}>`
- `<em>/<i>` → `<Text style={{ fontStyle: 'italic' }}>`

## Media

- `<img>` → `Image` (source={{ uri }} or require(...))
- `<video>`/`<audio>` → `expo-av` (Video, Audio)
- `<picture>`/`<source>` → conditional `Image` source selection in JS

## Links & Navigation

- `<a href>` (external) → `Pressable` + `Linking.openURL()`
- In-app navigation → react-navigation or expo-router

## Forms & Inputs

- `<input type="text">` → `TextInput`
- `password` → `TextInput secureTextEntry`
- `number` → `TextInput keyboardType="numeric"`
- `<textarea>` → `TextInput multiline`
- `<select>` → `@react-native-picker/picker` or custom modal
- `<button>` → `Pressable` / `TouchableOpacity` / `Button`
- No `<form>` element — manage state and validation in JS

## Lists & Tables

- `<ul>/<ol>/<li>` → `FlatList` / `SectionList` / `ScrollView` + item components
- `<table>` → construct grid with `View`/`FlatList` or use a table library

## Styling & CSS

- No external CSS files by default. Use:
  - `StyleSheet.create` or inline styles, or
  - NativeWind (Tailwind for RN) with `className`
- Flexbox is the layout system. Use Dimensions or `useWindowDimensions` for responsiveness.

## Events & DOM APIs

- `onClick` → `onPress` (Pressable/Touchable)
- `onChange` (inputs) → `onChangeText` for `TextInput`
- No `document`/`window` DOM APIs — use platform APIs and refs

## Accessibility

- Map `aria-*` to: `accessibilityLabel`, `accessibilityRole`, `accessibilityHint`, `accessible`, `accessibilityState`

## Icons & SVG

- `<svg>` → `react-native-svg`
- Icon sets → `@expo/vector-icons` or `react-native-vector-icons`

## Animations

- CSS animations → `Animated` API, Reanimated, or LayoutAnimation

## Storage & Networking

- `localStorage` → `AsyncStorage`, SecureStore, or MMKV
- `fetch` / `axios` work in RN for HTTP requests

## Web-only Features (not on native)

- `<canvas>`, `iframe`, browser DOM APIs, CSS Grid (limited) — use platform-specific replacements or web build (`react-native-web`)

## Useful Libraries / Tools

- Styling: NativeWind (Tailwind), styled-components/native
- Components: React Native Reusables (shadcn-like)
- Navigation: react-navigation or expo-router
- HTTP/Caching: axios + @tanstack/react-query
- Media: expo-av, react-native-webview
- SVG: react-native-svg

## Minimal example (mapping)

```tsx
import React from "react";
import { View, Text, Image, Pressable } from "react-native";

export default function Example() {
  return (
    <View style={{ padding: 16 }}>
      <Text style={{ fontSize: 20, fontWeight: "600" }}>Heading (h1)</Text>
      <Text>Paragraph text goes here.</Text>
      <Image
        source={{ uri: "https://example.com/monster.png" }}
        style={{ width: 120, height: 120 }}
      />
      <Pressable
        onPress={() => {}}
        style={{
          marginTop: 12,
          padding: 10,
          backgroundColor: "#0ea5a4",
          borderRadius: 8,
        }}
      >
        <Text style={{ color: "#fff" }}>Primary Button</Text>
      </Pressable>
    </View>
  );
}
```

Notes:

- Think in components and Flexbox, not DOM structure.
- For web + native reuse, use `react-native-web` and guard web-only code with `Platform.OS === 'web'`.

References:

- React Native docs: https://reactnative.dev
- Expo docs: https://expo.dev
- NativeWind: https://www.nativewind.dev
- React Native Reusables: https://reactnativereusables.com
