---
title: Search
head-extra: <link rel="stylesheet" type="text/css" href="/stork/basic.css"/>
---

<center>Enter your search query</center>
<input style="width:100%" data-stork="stork" />
<div data-stork="stork-output"></div>
<script src="/stork/stork.js"></script>
<script>
	stork.initialize("../stork/stork.wasm");
	stork.register("stork", "../stork/index.st");
</script>
