<script lang="ts">
	import favicon from '$lib/assets/favicon.svg';
	import '../app.css';
	import Sidebar from '$lib/components/Sidebar.svelte';

	let { children } = $props();
</script>

<svelte:head>
	<title>Ghislain Kean David | Automation Specialist</title>
	<meta name="description" content="Portfolio of Ghislain Kean David, an Automation Specialist building intelligent workflows and AI agent integrations." />
	<link rel="icon" href={favicon} />
</svelte:head>

<div class="app-container">
	<aside class="sidebar">
		<Sidebar />
	</aside>

	<main class="main-content">
		{@render children()}
	</main>
</div>

