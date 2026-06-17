<script lang="ts">
	import { onMount } from 'svelte';
	import { fly, fade } from 'svelte/transition';

	let mounted = $state(false);

	onMount(() => {
		mounted = true;
	});

	// Resume Experience Data
	const experiences = [
		{
			role: 'Junior Web Developer',
			company: 'Boomering Inc.',
			period: 'May 2025 – Jan 2026',
			description: 'Developed and maintained web applications using Next.js for building data-driven features and integrations with Airtable to support multiple internal and client-facing projects.',
			highlights: [
				'Accelerated development and ensured application quality by automating tasks through both low-code (Power Automate) and scripting (Google Apps Script) solutions.',
				'Implemented automated tests with Playwright, debugged APIs via Postman, and utilized AI assistants like Claude Code CLI and Gemini.'
			],
			tags: ['Claude', 'Gemini', 'Next.js', 'Airtable', 'Power Automate', 'Apps Script', 'Playwright', 'Postman']
		},
		{
			role: 'Full Stack Developer Intern',
			company: 'Clark Outsourcing',
			period: 'Dec 2024 – Mar 2025',
			description: 'Developed and integrated new web pages using Angular, enhancing the functionality and scalability of the company’s existing web application.',
			highlights: [
				'Built and tested RESTful APIs, utilizing Postman for payload validation, API debugging, and endpoint testing to ensure accurate data exchange.'
			],
			tags: ['Angular', 'Postman']
		}
	];

	// Resume Projects Data (Summarized to 2 bullet highlights per project, linking new images)
	const projects = [
		{
			name: 'Kimut Clinic',
			subtitle: 'Operations & Growth Platform',
			image: '/kimutclinic_projectpic.png',
			highlights: [
				'Engineered a full-stack clinic operations system featuring an AI voice receptionist (Retell AI) and a custom Svelte booking portal.',
				'Automated the full lead lifecycle, intake, and AI-personalized email/SMS marketing drip sequences across n8n, Supabase, and Google Calendar.'
			],
			tags: ['Claude', 'Antigravity', 'Svelte', 'n8n', 'Supabase', 'Retell AI', 'Anthropic API', 'Google Sheets'],
			github: 'https://github.com/GhislainKeanDavid/Kimut_Clinic',
			demo: 'https://clinic.keandavid.cloud'
		},
		{
			name: 'ApplyPro',
			subtitle: 'Autonomous AI Job Hunter',
			image: '/applypro_projectpic.png',
			highlights: [
				'Built an autonomous job hunting pipeline using n8n, Docker, and GPT-4o to scan Gmail alerts, parse descriptions, and execute semantic candidate-fit scoring.',
				'Implemented a state-aware deduplication filter using Google Sheets and integrated live candidate notification channels via Telegram API.'
			],
			tags: ['Claude', 'Antigravity', 'n8n', 'Docker', 'GPT-4o', 'Gmail API', 'Google Sheets', 'Telegram API'],
			github: 'https://github.com/GhislainKeanDavid/ApplyPro-AI-Job-Hunter'
		}
	];

	// Technology SVGs mapped for logo-only presentation
	const techIcons: Record<string, string> = {
		'Claude': `<path d="m4.7144 15.9555 4.7174-2.6471.079-.2307-.079-.1275h-.2307l-.7893-.0486-2.6956-.0729-2.3375-.0971-2.2646-.1214-.5707-.1215-.5343-.7042.0546-.3522.4797-.3218.686.0608 1.5179.1032 2.2767.1578 1.6514.0972 2.4468.255h.3886l.0546-.1579-.1336-.0971-.1032-.0972L6.973 9.8356l-2.55-1.6879-1.3356-.9714-.7225-.4918-.3643-.4614-.1578-1.0078.6557-.7225.8803.0607.2246.0607.8925.686 1.9064 1.4754 2.4893 1.8336.3643.3035.1457-.1032.0182-.0728-.164-.2733-1.3539-2.4467-1.445-2.4893-.6435-1.032-.17-.6194c-.0607-.255-.1032-.4674-.1032-.7285L6.287.1335 6.6997 0l.9957.1336.419.3642.6192 1.4147 1.0018 2.2282 1.5543 3.0296.4553.8985.2429.8318.091.255h.1579v-.1457l.1275-1.706.2368-2.0947.2307-2.6957.0789-.7589.3764-.9107.7468-.4918.5828.2793.4797.686-.0668.4433-.2853 1.8517-.5586 2.9021-.3643 1.9429h.2125l.2429-.2429.9835-1.3053 1.6514-2.0643.7286-.8196.85-.9046.5464-.4311h1.0321l.759 1.1293-.34 1.1657-1.0625 1.3478-.8804 1.1414-1.2628 1.7-.7893 1.36.0729.1093.1882-.0183 2.8535-.607 1.5421-.2794 1.8396-.3157.8318.3886.091.3946-.3278.8075-1.967.4857-2.3072.4614-3.4364.8136-.0425.0304.0486.0607 1.5482.1457.6618.0364h1.621l3.0175.2247.7892.522.4736.6376-.079.4857-1.2142.6193-1.6393-.3886-3.825-.9107-1.3113-.3279h-.1822v.1093l1.0929 1.0686 2.0035 1.8092 2.5075 2.3314.1275.5768-.3218.4554-.34-.0486-2.2039-1.6575-.85-.7468-1.9246-1.621h-.1275v.17l.4432.6496 2.3436 3.5214.1214 1.0807-.17.3521-.6071.2125-.6679-.1214-1.3721-1.9246L14.38 17.959l-1.1414-1.9428-.1397.079-.674 7.2552-.3156.3703-.7286.2793-.6071-.4614-.3218-.7468.3218-1.4753.3886-1.9246.3157-1.53.2853-1.9004.17-.6314-.0121-.0425-.1397.0182-1.4328 1.9672-2.1796 2.9446-1.7243 1.8456-.4128.164-.7164-.3704.0667-.6618.4008-.5889 2.386-3.0357 1.4389-1.882.929-1.0868-.0062-.1579h-.0546l-6.3385 4.1164-1.1293.1457-.4857-.4554.0608-.7467.2307-.2429 1.9064-1.3114Z" fill="currentColor"/>`,
		'Antigravity': `<path d="M21.751 22.607c1.34 1.005 3.35.335 1.508-1.508C17.73 15.74 18.904 1 12.037 1 5.17 1 6.342 15.74.815 21.1c-2.01 2.009.167 2.511 1.507 1.506 5.192-3.517 4.857-9.714 9.715-9.714 4.857 0 4.522 6.197 9.714 9.715z" fill="currentColor"/>`,
		'Svelte': `<path d="M19.1 7a5 5 0 00-7-.6L4.5 12.6a5 5 0 00-.6 7.2 5 5 0 007 .6l7.6-6.2a5 5 0 00.6-7.2zm-13.3 10.6c-1.1-1.3-.9-3.2.4-4.3l7.7-6.2c1.3-1.1 3.3-.9 4.4.4s.9 3.2-.4 4.3l-7.7 6.2c-1.3 1.1-3.3.9-4.4-.4z" fill="currentColor"/>`,
		'n8n': `<path d="M21.4737 5.6842c-1.1772 0-2.1663.8051-2.4468 1.8947h-2.8955c-1.235 0-2.289.893-2.492 2.111l-.1038.623a1.263 1.263 0 0 1-1.246 1.0555H11.289c-.2805-1.0896-1.2696-1.8947-2.4468-1.8947s-2.1663.8051-2.4467 1.8947H4.973c-.2805-1.0896-1.2696-1.8947-2.4468-1.8947C1.1311 9.4737 0 10.6047 0 12s1.131 2.5263 2.5263 2.5263c1.1772 0 2.1663-.8051 2.4468-1.8947h1.4223c.2804 1.0896 1.2696 1.8947 2.4467 1.8947 1.1772 0 2.1663-.8051 2.4468-1.8947h1.0008a1.263 1.263 0 0 1 1.2459 1.0555l.1038.623c.203 1.218 1.257 2.111 2.492 2.111h.3692c.2804 1.0895 1.2696 1.8947 2.4468 1.8947 1.3952 0 2.5263-1.131 2.5263-2.5263s-1.131-2.5263-2.5263-2.5263c-1.1772 0-2.1664.805-2.4468 1.8947h-.3692a1.263 1.263 0 0 1-1.246-1.0555l-.1037-.623A2.52 2.52 0 0 0 13.9607 12a2.52 2.52 0 0 0 .821-1.4794l.1038-.623a1.263 1.263 0 0 1 1.2459-1.0555h2.8955c.2805 1.0896 1.2696 1.8947 2.4468 1.8947 1.3952 0 2.5263-1.131 2.5263-2.5263s-1.131-2.5263-2.5263-2.5263m0 1.2632a1.263 1.263 0 0 1 1.2631 1.2631 1.263 1.263 0 0 1-1.2631 1.2632 1.263 1.263 0 0 1-1.2632-1.2632 1.263 1.263 0 0 1 1.2632-1.2631M2.5263 10.7368A1.263 1.263 0 0 1 3.7895 12a1.263 1.263 0 0 1-1.2632 1.2632A1.263 1.263 0 0 1 1.2632 12a1.263 1.263 0 0 1 1.2631-1.2632m6.3158 0A1.263 1.263 0 0 1 10.1053 12a1.263 1.263 0 0 1-1.2632 1.2632A1.263 1.263 0 0 1 7.579 12a1.263 1.263 0 0 1 1.2632-1.2632m10.1053 3.7895a1.263 1.263 0 0 1 1.2631 1.2632 1.263 1.263 0 0 1-1.2631 1.2631 1.263 1.263 0 0 1-1.2632-1.2631 1.263 1.263 0 0 1 1.2632-1.2632" fill="currentColor"/>`,
		'Supabase': `<path d="M12 2L2 9.3v5.4L12 22l10-7.3V9.3L12 2zm8 11.5l-8 5.8-8-5.8V10.2l8-5.8 8 5.8v3.3z" fill="currentColor"/>`,
		'Retell AI': `<path d="M12 2v20M17 5v14M7 5v14M22 9v6M2 9v6" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>`,
		'Anthropic API': `<path d="M12 2L2 22h4l2.5-5.5h7L18 22h4L12 2zm-2.5 12L12 8.5l2.5 5.5h-5z" fill="currentColor"/>`,
		'Google Sheets': `<path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-2 10h-4v4h-2v-4H7v-2h4V7h2v4h4v2z" fill="currentColor"/>`,
		'Docker': `<path d="M13.983 8.871h-1.996V6.877h1.996v1.994zm2.497 0h-1.996V6.877h1.996v1.994zm-4.993-2.496H9.493V4.38h1.995v1.995zm2.496 0h-1.996V4.38h1.996v1.995zm-4.992 2.496H6.997V6.877h1.995v1.994zm0-2.496H6.997V4.38h1.995v1.995zm4.992 4.993h-1.996v-1.994h1.996v1.994zm2.497 0h-1.996v-1.994h1.996v1.994zm2.497 0h-1.996v-1.994h1.996v1.994zM2 13.568c0 .285.031.57.086.852c.17 1.026.837 1.904 1.83 2.41c1.761.9 4.671 1.17 7.084 1.17c6.425 0 11.89-2.58 12.898-6.19c1.173-4.185-1.503-4.124-2.502-4.124h-1.636V6.81h-2.493v3.753H5.74V13.57H2z" fill="currentColor"/>`,
		'GPT-4o': `<path d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm-1-6.5a1 1 0 112 0 1 1 0 01-2 0zm1-5.5a1.5 1.5 0 110-3 1.5 1.5 0 010 3z" fill="currentColor"/>`,
		'Gmail API': `<path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z" fill="currentColor"/>`,
		'Telegram API': `<path d="M9.78 18.65l.28-4.28 7.68-6.94c.34-.3-.07-.46-.52-.18L7.74 13.3 3.64 12c-.9-.28-.9-.9.18-1.32L19.9 4.4c.74-.28 1.38.16 1.14 1.22l-2.74 12.92c-.2.92-.74 1.14-1.5 1.72l-4.2-3.1-2.02 1.95c-.22.22-.4.4-.82.46z" fill="currentColor"/>`,
		'Next.js': `<path d="M12 2C6.5 2 2 6.5 2 12s4.5 10 10 10 10-4.5 10-10S17.5 2 12 2zm4.3 14.3l-4.5-5.9V16h-1.5V8h1.5l4.3 5.7V8h1.5v8.3h-1.3z" fill="currentColor"/>`,
		'Airtable': `<path d="M11.992 1.966c-.434 0-.87.086-1.28.257L1.779 5.917c-.503.208-.49.908.012 1.116l8.982 3.558a3.266 3.266 0 0 0 2.454 0l8.982-3.558c.503-.196.503-.908.012-1.116l-8.957-3.694a3.255 3.255 0 0 0-1.272-.257zM23.4 8.056a.589.589 0 0 0-.222.045l-10.012 3.877a.612.612 0 0 0-.38.564v8.896a.6.6 0 0 0 .821.552L23.62 18.1a.583.583 0 0 0 .38-.551V8.653a.6.6 0 0 0-.6-.596zM.676 8.095a.644.644 0 0 0-.48.19C.086 8.396 0 8.53 0 8.69v8.355c0 .442.515.737.908.54l6.27-3.006.307-.147 2.969-1.436c.466-.22.43-.908-.061-1.092L.883 8.138a.57.57 0 0 0-.207-.044z"/>`,
		'Power Automate': `<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="-15 -13 122 122"><defs><linearGradient id="page_pa_paint0" x1="43" y1="55" x2="29" y2="10" gradientUnits="userSpaceOnUse"><stop stop-color="#0D36A5"/><stop offset="1" stop-color="#1152D4"/></linearGradient><linearGradient id="page_pa_paint1" x1="46" y1="10" x2="46" y2="86" gradientUnits="userSpaceOnUse"><stop stop-color="#84CAFF"/><stop offset="1" stop-color="#61B1FB"/></linearGradient><linearGradient id="page_pa_paint2" x1="37.5" y1="10" x2="37.5" y2="86" gradientUnits="userSpaceOnUse"><stop stop-color="#3B90F5"/><stop offset="1" stop-color="#2A78EE"/></linearGradient><mask id="page_pa_mask0" mask-type="alpha" maskUnits="userSpaceOnUse" x="-1" y="10" width="97" height="76"><path d="M61.2116 10C62.3496 10 63.4337 10.4847 64.1925 11.3328L94.6136 45.3328C95.9723 46.8514 95.9723 49.1486 94.6136 50.6672L64.1925 84.6672C63.4337 85.5153 62.3496 86 61.2116 86H3.94634C0.488777 86 -1.34012 81.9095 0.965366 79.3328L29 48L0.965366 16.6672C-1.34012 14.0905 0.488777 10 3.94634 10H61.2116Z" fill="white"/></mask></defs><g mask="url(#page_pa_mask0)"><path d="M63 10L29 48L-5 10H63Z" fill="url(#page_pa_paint0)"/><path d="M-5 86L63 10L97 48L63 86H-5Z" fill="url(#page_pa_paint1)"/><path d="M-5 86L63 10L80 29L29 86H-5Z" fill="url(#page_pa_paint2)"/></g></svg>`,
		'Apps Script': `<path d="M12.363 2.54a3.136 3.136 0 0 0-.376.022 2.864 2.864 0 0 0-1.589.828c-.562.58-.82 1.115-.773 1.943-.01.264.193 1.023.272 1.274 1.115 3.546 2.09 6.75 3.26 10.279.08.246.168.486.267.72.02.047.035.046.048-.004.077-.297.174-.612.29-.945.894-2.576 1.772-5.14 2.633-7.696a.345.345 0 0 0 .004-.217 163.054 163.054 0 0 0-1.49-4.572 2.603 2.603 0 0 0-.704-.933c-.55-.46-1.166-.694-1.842-.7Zm9.078.117a2.734 2.734 0 0 0-2.878 1.828l-4.576 13.289a2.734 2.734 0 0 0 1.695 3.475l.12.04a2.734 2.734 0 0 0 3.475-1.694L23.85 6.307a2.734 2.734 0 0 0-1.695-3.476c-.233-.1-.506-.124-.716-.174ZM12.375 3.96a1.396 1.396 0 1 1 0 2.791 1.395 1.395 0 0 1 0-2.791 1.395 1.395 0 0 1 0 2.79zm8.809.07a1.402 1.402 0 1 1 0 2.803 1.402 1.402 0 0 1 0-2.803zM5.419 7.605a2.853 2.853 0 0 0-.468.052 2.683 2.683 0 0 0-1.337.627 2.62 2.62 0 0 0-.924 1.833 3.808 3.808 0 0 0 0 .648 2.52 2.52 0 0 0 .673 1.52c.221.238.465.454.732.648 3.043 2.21 6.08 4.43 9.108 6.664a.78.78 0 0 0 .158.089c.03-.043.032-.098.007-.167a17.409 17.409 0 0 0-.317-1.066 532.752 532.752 0 0 1-2.02-6.251 41.91 41.91 0 0 0-.497-1.477c-.967-.849-2.078-1.6-3.023-2.302A3.848 3.848 0 0 0 6.153 7.7a2.388 2.388 0 0 0-.734-.094Zm.02 1.424a1.398 1.398 0 1 1 0 2.796 1.398 1.398 0 0 1 0-2.796zm-2.458 6.792c-.733-.006-1.375.202-1.927.622a2.72 2.72 0 0 0-.95 1.45 2.78 2.78 0 0 0-.09 1.04 2.74 2.74 0 0 0 .695 1.583c.664.578 1.26.85 2 .945 1.42-.005 2.84-.012 4.262-.02h.418c2.277-.003 4.513-.002 6.706.003.148.005.28.003.392-.01.06-.005.091-.031.092-.077a10.656 10.656 0 0 0-.834-.653 488.746 488.746 0 0 1-6.57-4.815.236.236 0 0 0-.14-.047c-1.34-.003-2.691-.01-4.054-.02zm-.19 1.418a1.402 1.402 0 1 1 0 2.803 1.402 1.402 0 0 1 0-2.803zm13.874.002a1.4 1.4 0 1 1 0 2.8 1.4 1.4 0 0 1 0-2.8z" fill="currentColor"/>`,
		'Playwright': `<path d="M23.996 7.462c-.056.837-.257 2.135-.716 3.85-.995 3.715-4.27 10.874-10.42 9.227-6.15-1.65-5.407-9.487-4.412-13.201.46-1.716.934-2.94 1.305-3.694.42-.853.846-.289 1.815.523.684.573 2.41 1.791 5.011 2.488 2.601.697 4.706.506 5.583.352 1.245-.219 1.897-.494 1.834.455Zm-9.807 3.863s-.127-1.819-1.773-2.286c-1.644-.467-2.613 1.04-2.613 1.04Zm4.058 4.539-7.769-2.172s.446 2.306 3.338 3.153c2.862.836 4.43-.98 4.43-.981Zm2.701-2.51s-.13-1.818-1.773-2.286c-1.644-.469-2.612 1.038-2.612 1.038ZM8.57 18.23c-4.749 1.279-7.261-4.224-8.021-7.08C.197 9.831.044 8.832.003 8.188c-.047-.73.455-.52 1.415-.354.677.118 2.3.261 4.308-.28a11.28 11.28 0 0 0 2.41-.956c-.058.197-.114.4-.17.61-.433 1.618-.827 4.055-.632 6.426-1.976.732-2.267 2.423-2.267 2.423l2.524-.715c.227 1.002.6 1.987 1.15 2.838a5.914 5.914 0 0 1-.171.049Zm-4.188-6.298c1.265-.333 1.363-1.631 1.363-1.631l-3.374.888s.745 1.076 2.01.743Z" fill="currentColor"/>`,
		'Postman': `<path d="M13.527.099C6.955-.744.942 3.9.099 10.473c-.843 6.572 3.8 12.584 10.373 13.428 6.573.843 12.587-3.801 13.428-10.374C24.744 6.955 20.101.943 13.527.099zm2.471 7.485a.855.855 0 0 0-.593.25l-4.453 4.453-.307-.307-.643-.643c4.389-4.376 5.18-4.418 5.996-3.753zm-4.863 4.861l4.44-4.44a.62.62 0 1 1 .847.903l-4.699 4.125-.588-.588zm.33.694l-1.1.238a.06.06 0 0 1-.067-.032.06.06 0 0 1 .01-.073l.645-.645.512.512zm-2.803-.459l1.172-1.172.879.878-1.979.426a.074.074 0 0 1-.085-.039.072.072 0 0 1 .013-.093zm-3.646 6.058a.076.076 0 0 1-.069-.083.077.077 0 0 1 .022-.046h.002l.946-.946 1.222 1.222-2.123-.147zm2.425-1.256" fill="currentColor"/>`,
		'Gemini': `<path d="M11.04 19.32Q12 21.51 12 24q0-2.49.93-4.68.96-2.19 2.58-3.81t3.81-2.55Q21.51 12 24 12q-2.49 0-4.68-.93a12.3 12.3 0 0 1-3.81-2.58 12.3 12.3 0 0 1-2.58-3.81Q12 2.49 12 0q0 2.49-.96 4.68-.93 2.19-2.55 3.81a12.3 12.3 0 0 1-3.81 2.58Q2.49 12 0 12q2.49 0 4.68.96 2.19.93 3.81 2.55t2.55 3.81"/>`,
		'Angular': `<path d="M12 0L1.75 3.75l1.625 12.875L12 24l8.625-7.375L22.25 3.75zm0 2.625l7.5 2.625-1.125 9.75L12 21.375V2.625z"/>`,
		'Python': `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 110 110" fill="none"><path fill="#3776AB" d="M55 2.6c-18 0-26.3 7.8-26.3 22.8h17.3c0-8.8 4.7-12.8 14-12.8 9 0 12.8 3.8 12.8 10.3v7.7H45.4C30.4 30.6 22 37.3 22 52.3v17.3c0 15 9.3 22.8 26.3 22.8h5.8V77.1c0-10 6.4-15 15.4-15h27.9c15 0 22.8-8.4 22.8-23.4V21.4c0-15-7.8-18.8-22.8-18.8H55z"/><path fill="#FFE873" d="M55 107.4c18 0 26.3-7.8 26.3-22.8H64c0 8.8-4.7 12.8-14 12.8-9 0-12.8-3.8-12.8-10.3v-7.7h27.4c15 0 23.4-6.7 23.4-21.7V50.4c0-15-9.3-22.8-26.3-22.8h-5.8V42.9c0 10-6.4 15-15.4 15H17.3c-15 0-22.8 8.4-22.8 23.4v17.3c0 15 7.8 18.8 22.8 18.8H55z"/></svg>`
	};

	const fallbackIcon = `<path d="M12 2a10 10 0 1010 10A10 10 0 0012 2zm1 14.5h-2v-2h2zm0-4.5h-2V7h2z" fill="currentColor"/>`;

	// Official brand colors per technology (used to tint the logos in the cards)
	const techColors: Record<string, string> = {
		'Claude': '#d97757',
		'Antigravity': '#a855f7',
		'Svelte': '#ff3e00',
		'n8n': '#ea4b71',
		'Supabase': '#3ecf8e',
		'Retell AI': '#5b5bd6',
		'Anthropic API': '#d97757',
		'Google Sheets': '#0f9d58',
		'Docker': '#2496ed',
		'GPT-4o': '#10a37f',
		'Gmail API': '#ea4335',
		'Telegram API': '#26a5e4',
		'Next.js': '#ffffff',
		'Airtable': '#fcb400',
		'Power Automate': '#2a78ee',
		'Apps Script': '#4285f4',
		'Playwright': '#2ead33',
		'Postman': '#ff6c37',
		'Gemini': '#4285f4',
		'Angular': '#dd0031',
		'Python': '#3776ab'
	};
</script>

{#if mounted}
	<!-- Experiences Section -->
	<section class="section" in:fly={{ y: 30, duration: 1000, delay: 350 }}>
		<h2 class="section-heading"><span class="heading-number">01.</span> Work Experience</h2>
		<div class="timeline">
			<div class="timeline-line"></div>
			{#each experiences as exp, idx}
				<div class="timeline-item" in:fly={{ y: 20, duration: 800, delay: 400 + idx * 100 }}>
					<div class="timeline-dot"></div>
					<div class="timeline-content glass-card">
						<div class="timeline-header">
							<div>
								<h3 class="role-title">{exp.role}</h3>
								<span class="company-name">{exp.company}</span>
							</div>
							<span class="timeline-date">{exp.period}</span>
						</div>
						<p class="timeline-desc">{exp.description}</p>
						<ul class="highlights-list">
							{#each exp.highlights as highlight}
								<li>{highlight}</li>
							{/each}
						</ul>

						<!-- Tech Stack Logos Only with Tooltips -->
						<div class="project-tech-only" style="margin-top: 1.25rem;">
							{#each exp.tags as tag}
								<div class="tech-logo-badge" style="--brand: {techColors[tag] ?? 'var(--text-secondary)'}">
									{#if techIcons[tag]}
										{#if techIcons[tag].startsWith('<svg')}
											{@html techIcons[tag].replace('<svg', '<svg class="tech-logo-icon"')}
										{:else}
											<svg viewBox="0 0 24 24" class="tech-logo-icon">
												{@html techIcons[tag]}
											</svg>
										{/if}
									{:else}
										<svg viewBox="0 0 24 24" class="tech-logo-icon">
											{@html fallbackIcon}
										</svg>
									{/if}
									<span class="tech-logo-tooltip">{tag}</span>
								</div>
							{/each}
						</div>
					</div>
				</div>
			{/each}
		</div>
	</section>

	<!-- Projects Section (Redesigned stretch layout to make images align with text height) -->
	<section class="section" in:fly={{ y: 30, duration: 1000, delay: 600 }}>
		<h2 class="section-heading"><span class="heading-number">02.</span> Projects</h2>
		<div class="projects-list">
			{#each projects as project, idx}
				<div class="project-item glass-card" in:fly={{ y: 20, duration: 800, delay: 650 + idx * 100 }}>
					<!-- Left Side: Project Image Preview (Stretches to fill vertical height of parent) -->
					<div class="project-image-side">
						<img src={project.image} alt={project.name} class="project-img" />
						<div class="project-img-overlay"></div>
					</div>
					
					<!-- Right Side: Project Information & Timeline Bullet style -->
					<div class="project-info-side">
						<div class="project-header">
							<div>
								<h3 class="project-name">{project.name}</h3>
								<span class="project-subtitle">{project.subtitle}</span>
							</div>
							<div class="project-links">
								<a href={project.github} target="_blank" rel="noopener noreferrer" aria-label="GitHub Repository">
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="link-icon">
										<path d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"/>
									</svg>
								</a>
								{#if project.demo}
									<a href={project.demo} target="_blank" rel="noopener noreferrer" aria-label="Live Demo">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="link-icon">
											<path d="M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41 9.83-9.83V9h2V3h-6z"/>
										</svg>
									</a>
								{/if}
							</div>
						</div>

						<ul class="highlights-list">
							{#each project.highlights as highlight}
								<li>{highlight}</li>
							{/each}
						</ul>

						<!-- Tech Stack Logos Only with Tooltips -->
						<div class="project-tech-only">
							{#each project.tags as tag}
								<div class="tech-logo-badge" style="--brand: {techColors[tag] ?? 'var(--text-secondary)'}">
									{#if techIcons[tag]}
										{#if techIcons[tag].startsWith('<svg')}
											{@html techIcons[tag].replace('<svg', '<svg class="tech-logo-icon"')}
										{:else}
											<svg viewBox="0 0 24 24" class="tech-logo-icon">
												{@html techIcons[tag]}
											</svg>
										{/if}
									{:else}
										<svg viewBox="0 0 24 24" class="tech-logo-icon">
											{@html fallbackIcon}
										</svg>
									{/if}
									<span class="tech-logo-tooltip">{tag}</span>
								</div>
							{/each}
						</div>
					</div>
				</div>
			{/each}
		</div>
	</section>
{/if}

<style>
	.section {
		display: flex;
		flex-direction: column;
		gap: 2rem;
		scroll-margin-top: 4rem;
		width: 100%;
		max-width: 960px; /* keeps content compact on large monitors */
	}

	.section-heading {
		font-size: 1.75rem;
		display: flex;
		align-items: center;
		color: var(--text-primary);
		font-weight: 700;
	}

	.section-heading::after {
		content: '';
		display: block;
		height: 1px;
		flex-grow: 1;
		margin-left: 1.5rem;
		background: linear-gradient(90deg, var(--border-color-glow), transparent);
	}

	.heading-number {
		font-family: var(--font-mono);
		font-size: 1.25rem;
		color: var(--accent-orange);
		margin-right: 0.75rem;
		font-weight: 400;
	}

	/* Timeline Style */
	.timeline {
		position: relative;
		display: flex;
		flex-direction: column;
		gap: 2.5rem;
		padding-left: 2rem;
	}

	.timeline-line {
		position: absolute;
		left: 5px;
		top: 0.5rem;
		bottom: 0.5rem;
		width: 2px;
		background: linear-gradient(180deg, var(--accent-orange-glow), var(--accent-sand-glow));
	}

	.timeline-item {
		position: relative;
	}

	.timeline-dot {
		position: absolute;
		left: -24px;
		top: 2rem;
		width: 12px;
		height: 12px;
		border-radius: 50%;
		background: var(--bg-color-main);
		border: 2px solid var(--accent-orange);
		z-index: 2;
		transition: var(--transition-fast);
		box-shadow: 0 0 8px var(--accent-orange-glow);
	}

	.timeline-item:hover .timeline-dot {
		background: var(--accent-orange);
		box-shadow: 0 0 14px var(--accent-orange);
		transform: scale(1.2);
	}

	.timeline-header {
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
		flex-wrap: wrap;
		gap: 0.5rem;
		margin-bottom: 1rem;
	}

	.role-title {
		font-size: 1.25rem;
		color: var(--text-primary);
		font-weight: 600;
	}

	.company-name {
		font-family: var(--font-mono);
		font-size: 0.9rem;
		color: var(--accent-orange);
	}

	.timeline-date {
		font-size: 0.85rem;
		color: var(--text-secondary);
		font-family: var(--font-mono);
		background: rgba(255, 255, 255, 0.03);
		padding: 0.25rem 0.6rem;
		border-radius: 4px;
		border: 1px solid var(--border-color);
	}

	.timeline-desc {
		font-size: 0.95rem;
		color: var(--text-secondary);
		line-height: 1.6;
		margin-bottom: 1rem;
	}

	/* General highlights list formatting used in experience & projects */
	.highlights-list {
		display: flex;
		flex-direction: column;
		gap: 0.6rem;
		padding-left: 1.25rem;
		color: var(--text-secondary);
		font-size: 0.925rem;
		line-height: 1.6;
	}

	.highlights-list li::marker {
		color: var(--accent-orange);
	}

	/* Redesigned Projects List Section */
	.projects-list {
		display: flex;
		flex-direction: column;
		gap: 2.5rem;
	}

	.project-item {
		display: flex;
		gap: 2.5rem;
		padding: 2.5rem;
		align-items: stretch; /* Stretches left and right sides to match heights */
	}

	/* Project Image Side layout */
	.project-image-side {
		width: 40%;
		flex-shrink: 0;
		position: relative;
		border-radius: 8px;
		overflow: hidden;
		border: 1px solid var(--border-color);
		box-shadow: 0 4px 20px rgba(0, 0, 0, 0.35);
		background: var(--bg-color-main);
		/* aspect-ratio removed on desktop to allow stretching */
	}

	.project-img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		display: block;
		transition: var(--transition-smooth);
	}

	.project-img-overlay {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: linear-gradient(135deg, rgba(217, 90, 56, 0.05), rgba(203, 191, 174, 0.05));
		pointer-events: none;
		transition: var(--transition-smooth);
	}

	.project-item:hover .project-img {
		transform: scale(1.04);
	}

	.project-item:hover .project-img-overlay {
		opacity: 0;
	}

	/* Project Info Side layout */
	.project-info-side {
		width: 60%;
		display: flex;
		flex-direction: column;
		gap: 1.25rem;
		justify-content: space-between; /* Spreads content nicely top to bottom */
	}

	.project-header {
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
		gap: 1rem;
	}

	.project-name {
		font-size: 1.25rem;
		color: var(--text-primary);
		font-weight: 600;
		line-height: 1.3;
		transition: var(--transition-fast);
	}

	.project-subtitle {
		font-family: var(--font-mono);
		font-size: 0.9rem;
		color: var(--accent-orange);
		display: block;
		margin-top: 0.25rem;
	}

	.project-item:hover .project-name {
		color: var(--accent-orange);
	}

	.project-links {
		display: flex;
		gap: 0.75rem;
		flex-shrink: 0;
	}

	.link-icon {
		width: 20px;
		height: 20px;
		fill: var(--text-secondary);
		transition: var(--transition-fast);
	}

	.link-icon:hover {
		fill: var(--accent-orange);
		transform: translateY(-2px);
	}

	/* Logo-Only Badges Styling */
	.project-tech-only {
		display: flex;
		flex-wrap: wrap;
		gap: 0.5rem;
		margin-top: 0.5rem;
	}

	.tech-logo-badge {
		position: relative;
		display: inline-flex;
		align-items: center;
		justify-content: center;
		width: 34px;
		height: 34px;
		background: rgba(255, 255, 255, 0.02);
		border: 1px solid var(--border-color);
		color: var(--brand, var(--text-secondary));
		border-radius: 8px;
		transition: var(--transition-fast);
	}

	.tech-logo-badge:hover {
		border-color: var(--brand, var(--accent-orange-glow));
		background: color-mix(in srgb, var(--brand, var(--accent-orange)) 12%, transparent);
		transform: translateY(-2px);
		box-shadow: 0 4px 10px color-mix(in srgb, var(--brand, var(--accent-orange)) 25%, transparent);
	}

	.tech-logo-icon {
		width: 18px;
		height: 18px;
		flex-shrink: 0;
	}

	.tech-logo-tooltip {
		position: absolute;
		bottom: 130%;
		left: 50%;
		transform: translateX(-50%) translateY(4px);
		background: var(--bg-color-card);
		border: 1px solid var(--border-color);
		color: var(--text-primary);
		padding: 0.3rem 0.6rem;
		border-radius: 4px;
		font-size: 0.725rem;
		font-family: var(--font-mono);
		opacity: 0;
		pointer-events: none;
		transition: var(--transition-fast);
		white-space: nowrap;
		box-shadow: var(--glow-shadow);
		z-index: 20;
	}

	.tech-logo-badge:hover .tech-logo-tooltip {
		opacity: 1;
		transform: translateX(-50%) translateY(0);
	}

	@media (max-width: 900px) {
		.project-item {
			flex-direction: column;
			gap: 1.5rem;
			padding: 2rem 1.5rem;
			align-items: stretch;
		}
		.project-image-side {
			width: 100%;
			max-width: 100%;
			aspect-ratio: 1.6; /* Retains nice shape on mobile vertical stack */
			align-self: center;
		}
		.project-info-side {
			width: 100%;
		}
	}

	@media (max-width: 640px) {
		.timeline {
			padding-left: 1rem;
		}
		.timeline-dot {
			left: -20px;
		}
		.timeline-header {
			flex-direction: column;
		}
		.timeline-date {
			align-self: flex-start;
		}
	}
</style>
