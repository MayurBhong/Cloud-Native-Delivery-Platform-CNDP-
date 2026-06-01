<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NexOps — AWS & DevOps Engineering</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@400;500;600;700&family=Exo+2:wght@300;400;600;800&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg:       #04080f;
      --bg2:      #070d1a;
      --glass:    rgba(255,255,255,0.03);
      --border:   rgba(255,153,0,0.18);
      --border2:  rgba(0,210,255,0.12);
      --aws:      #ff9900;
      --aws-dim:  rgba(255,153,0,0.12);
      --cyan:     #00d2ff;
      --cyan-dim: rgba(0,210,255,0.10);
      --green:    #00e676;
      --red:      #ff4757;
      --text:     #a8bfd8;
      --bright:   #e8f4ff;
      --muted:    #3d5c7a;
      --nav-h:    68px;
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }

    body {
      background: var(--bg);
      color: var(--text);
      font-family: 'Rajdhani', sans-serif;
      font-size: 16px;
      overflow-x: hidden;
    }

    /* ══════════ CANVAS PARTICLES ══════════ */
    #particles { position: fixed; inset: 0; z-index: 0; pointer-events: none; }

    /* ══════════ GRID OVERLAY ══════════ */
    body::before {
      content: '';
      position: fixed; inset: 0; z-index: 0; pointer-events: none;
      background-image:
        linear-gradient(rgba(0,210,255,0.025) 1px, transparent 1px),
        linear-gradient(90deg, rgba(0,210,255,0.025) 1px, transparent 1px);
      background-size: 48px 48px;
    }

    /* ══════════ NAV ══════════ */
    nav {
      position: fixed; top: 0; left: 0; right: 0; z-index: 100;
      height: var(--nav-h);
      display: flex; align-items: center; justify-content: space-between;
      padding: 0 4rem;
      background: rgba(4,8,15,0.85);
      backdrop-filter: blur(18px);
      border-bottom: 1px solid var(--border);
    }

    .nav-logo {
      font-family: 'Exo 2', sans-serif;
      font-weight: 800; font-size: 1.5rem;
      color: var(--bright); letter-spacing: 0.04em;
      text-decoration: none;
    }
    .nav-logo .dot { color: var(--aws); }

    .nav-links { display: flex; gap: 2.4rem; list-style: none; }
    .nav-links a {
      color: var(--muted); text-decoration: none;
      font-size: 0.82rem; font-weight: 600;
      letter-spacing: 0.12em; text-transform: uppercase;
      transition: color 0.2s;
      position: relative; padding-bottom: 4px;
    }
    .nav-links a::after {
      content: ''; position: absolute; bottom: 0; left: 0; right: 0;
      height: 1px; background: var(--aws);
      transform: scaleX(0); transform-origin: left; transition: transform 0.25s;
    }
    .nav-links a:hover { color: var(--bright); }
    .nav-links a:hover::after { transform: scaleX(1); }

    .nav-btn {
      background: var(--aws); color: #000; border: none;
      padding: 0.5rem 1.4rem;
      font-family: 'Exo 2', sans-serif; font-weight: 700;
      font-size: 0.78rem; letter-spacing: 0.1em; text-transform: uppercase;
      cursor: pointer; transition: all 0.2s; clip-path: polygon(8px 0%,100% 0%,100% calc(100% - 8px),calc(100% - 8px) 100%,0% 100%,0% 8px);
    }
    .nav-btn:hover { background: var(--cyan); transform: translateY(-1px); }

    /* ══════════ HERO ══════════ */
    .hero {
      min-height: 100vh;
      display: flex; flex-direction: column;
      justify-content: center; align-items: flex-start;
      padding: calc(var(--nav-h) + 4rem) 4rem 4rem;
      position: relative; z-index: 1;
      max-width: 1300px; margin: 0 auto;
    }

    .hero-eyebrow {
      font-size: 0.75rem; font-weight: 600; letter-spacing: 0.3em;
      text-transform: uppercase; color: var(--aws);
      display: flex; align-items: center; gap: 1rem;
      margin-bottom: 1.8rem;
      animation: fadeUp 0.8s ease both;
    }
    .hero-eyebrow::before { content: ''; width: 36px; height: 1px; background: var(--aws); }

    .hero h1 {
      font-family: 'Exo 2', sans-serif;
      font-size: clamp(3.2rem, 7vw, 6.5rem);
      font-weight: 800; line-height: 1;
      color: var(--bright); letter-spacing: -0.02em;
      animation: fadeUp 0.8s 0.1s ease both;
    }
    .hero h1 em { color: var(--aws); font-style: normal; }
    .hero h1 .sub-em { color: var(--cyan); }

    .hero-desc {
      margin-top: 2rem; max-width: 540px;
      color: var(--text); font-size: 1rem; line-height: 1.9;
      animation: fadeUp 0.8s 0.2s ease both;
    }

    .hero-actions {
      display: flex; gap: 1rem; margin-top: 2.8rem;
      animation: fadeUp 0.8s 0.3s ease both;
    }

    .btn-primary {
      background: var(--aws); color: #000; border: none;
      padding: 0.85rem 2.2rem;
      font-family: 'Exo 2', sans-serif; font-weight: 700;
      font-size: 0.82rem; letter-spacing: 0.1em; text-transform: uppercase;
      cursor: pointer; transition: all 0.25s; text-decoration: none;
      clip-path: polygon(10px 0%,100% 0%,100% calc(100% - 10px),calc(100% - 10px) 100%,0% 100%,0% 10px);
    }
    .btn-primary:hover { background: var(--bright); transform: translateY(-2px) translateX(-2px); box-shadow: 4px 4px 0 var(--aws); }

    .btn-outline {
      background: transparent; color: var(--cyan);
      border: 1px solid var(--cyan); padding: 0.85rem 2.2rem;
      font-family: 'Exo 2', sans-serif; font-weight: 600;
      font-size: 0.82rem; letter-spacing: 0.1em; text-transform: uppercase;
      cursor: pointer; transition: all 0.25s; text-decoration: none;
    }
    .btn-outline:hover { background: var(--cyan-dim); transform: translateY(-2px); }

    /* live status badge */
    .live-badge {
      display: flex; align-items: center; gap: 0.5rem;
      margin-top: 2.5rem; font-size: 0.72rem; letter-spacing: 0.1em;
      color: var(--muted); animation: fadeUp 0.8s 0.35s ease both;
    }
    .live-dot {
      width: 8px; height: 8px; border-radius: 50%; background: var(--green);
      box-shadow: 0 0 8px var(--green); animation: pulse-dot 2s ease infinite;
    }
    @keyframes pulse-dot { 0%,100%{opacity:1;transform:scale(1)} 50%{opacity:0.5;transform:scale(0.7)} }

    /* hero right — floating terminal */
    .hero-terminal {
      position: absolute; right: 0; top: 50%;
      transform: translateY(-42%);
      width: 420px;
      background: rgba(7,13,26,0.9);
      border: 1px solid var(--border);
      backdrop-filter: blur(12px);
      box-shadow: 0 0 60px rgba(255,153,0,0.12), 0 0 120px rgba(0,210,255,0.06);
      animation: fadeUp 0.9s 0.4s ease both;
    }
    .term-bar {
      padding: 0.65rem 1rem; background: rgba(255,255,255,0.03);
      border-bottom: 1px solid var(--border);
      display: flex; align-items: center; gap: 0.5rem;
    }
    .tdot { width: 10px; height: 10px; border-radius: 50%; }
    .td-r{background:#ff5f57} .td-y{background:#febc2e} .td-g{background:#28c840}
    .term-title { margin-left: auto; font-size: 0.6rem; color: var(--muted); letter-spacing: 0.1em; }
    .term-body { padding: 1.4rem; font-family: 'Rajdhani', monospace; font-size: 0.8rem; line-height: 2.1; }
    .tl { display: flex; gap: 0.5rem; }
    .tp { color: var(--green); flex-shrink: 0; }
    .tc { color: var(--bright); }
    .to { color: var(--muted); padding-left: 1rem; }
    .tk { color: var(--aws); }
    .tv { color: var(--cyan); }
    .tcm { color: rgba(61,92,122,0.6); }
    .blink { display:inline-block; width:7px; height:14px; background:var(--aws); vertical-align:middle; animation:blink 1s steps(1) infinite; }
    @keyframes blink { 50%{opacity:0} }

    /* ══════════ METRICS STRIP ══════════ */
    .metrics {
      position: relative; z-index: 1;
      background: var(--bg2);
      border-top: 1px solid var(--border);
      border-bottom: 1px solid var(--border);
      display: grid; grid-template-columns: repeat(4,1fr);
    }
    .metric {
      padding: 2.2rem 2rem;
      border-right: 1px solid var(--border);
      position: relative; overflow: hidden;
      transition: background 0.3s;
    }
    .metric:last-child { border-right: none; }
    .metric:hover { background: var(--aws-dim); }
    .metric::after {
      content: ''; position: absolute; bottom: 0; left: 0; right: 0;
      height: 2px; background: var(--aws);
      transform: scaleX(0); transform-origin: left; transition: transform 0.4s;
    }
    .metric:hover::after { transform: scaleX(1); }
    .m-val {
      font-family: 'Exo 2', sans-serif; font-size: 2.8rem;
      font-weight: 800; color: var(--bright); line-height: 1;
      letter-spacing: -0.03em;
    }
    .m-val sup { font-size: 1.2rem; color: var(--aws); }
    .m-label { margin-top: 0.4rem; font-size: 0.72rem; color: var(--muted); letter-spacing: 0.12em; text-transform: uppercase; }

    /* ══════════ SECTION COMMON ══════════ */
    section { position: relative; z-index: 1; }
    .wrap { max-width: 1300px; margin: 0 auto; padding: 6rem 4rem; }

    .sec-tag {
      font-size: 0.68rem; font-weight: 600; letter-spacing: 0.25em;
      text-transform: uppercase; color: var(--muted);
      display: flex; align-items: center; gap: 0.8rem; margin-bottom: 1rem;
    }
    .sec-tag::before { content: '//'; color: var(--aws); font-weight: 700; }

    .sec-title {
      font-family: 'Exo 2', sans-serif;
      font-size: clamp(2rem, 4vw, 3.2rem); font-weight: 800;
      color: var(--bright); letter-spacing: -0.02em; line-height: 1.05;
      margin-bottom: 1rem;
    }

    /* ══════════ SERVICES ══════════ */
    .services-bg { background: var(--bg2); }

    .services-grid {
      display: grid; grid-template-columns: repeat(3,1fr);
      gap: 1px; background: var(--border);
      border: 1px solid var(--border);
      margin-top: 3.5rem;
    }

    .svc {
      background: var(--bg2); padding: 2.4rem;
      position: relative; overflow: hidden;
      transition: background 0.3s;
    }
    .svc::before {
      content: ''; position: absolute; top: 0; left: 0; right: 0; height: 2px;
      background: var(--svc-color, var(--aws));
      transform: scaleX(0); transform-origin: left; transition: transform 0.3s;
    }
    .svc:hover { background: var(--glass); }
    .svc:hover::before { transform: scaleX(1); }

    .svc-icon { font-size: 2rem; margin-bottom: 1.2rem; display: block; }
    .svc-name {
      font-family: 'Exo 2', sans-serif; font-size: 1.05rem; font-weight: 700;
      color: var(--bright); margin-bottom: 0.6rem;
    }
    .svc-text { font-size: 0.85rem; color: var(--text); line-height: 1.75; }
    .svc-tags { display: flex; flex-wrap: wrap; gap: 0.4rem; margin-top: 1.4rem; }
    .stag {
      font-size: 0.6rem; font-weight: 600; letter-spacing: 0.08em;
      text-transform: uppercase; padding: 0.22rem 0.6rem;
      border: 1px solid var(--border2); color: var(--muted);
      transition: all 0.2s;
    }
    .stag:hover { border-color: var(--aws); color: var(--aws); }

    /* ══════════ SKILLS TABLE ══════════ */
    .table-wrap { overflow-x: auto; margin-top: 3rem; }

    table {
      width: 100%; border-collapse: collapse;
      font-family: 'Rajdhani', sans-serif; font-size: 0.88rem;
    }
    thead tr {
      background: rgba(255,153,0,0.12);
    }
    thead th {
      padding: 14px 18px; text-align: left;
      font-family: 'Exo 2', sans-serif; font-size: 0.75rem;
      font-weight: 700; letter-spacing: 0.15em; text-transform: uppercase;
      color: var(--aws); border: 1px solid var(--border);
    }
    tbody tr {
      border-bottom: 1px solid var(--border);
      transition: background 0.2s;
    }
    tbody tr:hover { background: var(--aws-dim); }
    tbody td {
      padding: 14px 18px; color: var(--text);
      border: 1px solid var(--border); vertical-align: middle;
    }
    tbody td:first-child { color: var(--bright); font-weight: 600; }
    tbody td i { color: var(--cyan); margin-right: 6px; }

    .level-bar {
      height: 4px; background: var(--border);
      border-radius: 2px; min-width: 120px; position: relative; overflow: hidden;
    }
    .level-fill {
      height: 100%; background: linear-gradient(90deg, var(--aws), var(--cyan));
      border-radius: 2px;
    }

    /* ══════════ PIPELINE ══════════ */
    .pipeline-bg { background: var(--bg2); }
    .pipe-grid {
      display: grid; grid-template-columns: 1fr 1fr;
      gap: 5rem; align-items: center; margin-top: 3.5rem;
    }

    .pipe-steps { display: flex; flex-direction: column; }
    .pstep {
      display: flex; gap: 1.4rem;
      padding: 1.4rem;
      border: 1px solid var(--border); border-bottom: none;
      background: var(--bg); transition: background 0.25s;
    }
    .pstep:last-child { border-bottom: 1px solid var(--border); }
    .pstep:hover { background: var(--card, #0c1220); }
    .pstep.done  { border-left: 2px solid var(--green); }
    .pstep.run   { border-left: 2px solid var(--aws); }
    .pstep.wait  { border-left: 2px solid var(--border); }

    .pn { font-size: 0.65rem; font-weight: 700; color: var(--aws); min-width: 24px; margin-top: 2px; }
    .pname { font-family: 'Exo 2', sans-serif; font-weight: 700; color: var(--bright); font-size: 0.95rem; }
    .pdesc { font-size: 0.75rem; color: var(--muted); margin-top: 2px; line-height: 1.6; }
    .pbadge {
      margin-left: auto; font-size: 0.58rem; font-weight: 700;
      letter-spacing: 0.1em; text-transform: uppercase;
      padding: 0.2rem 0.65rem; align-self: flex-start; white-space: nowrap;
    }
    .b-done { color: var(--green); border: 1px solid var(--green); }
    .b-run  { color: var(--aws); border: 1px solid var(--aws); animation: pulse-dot 1.5s ease infinite; }
    .b-wait { color: var(--muted); border: 1px solid var(--border); }

    .pipe-info h3 {
      font-family: 'Exo 2', sans-serif; font-size: 1.7rem; font-weight: 800;
      color: var(--bright); margin-bottom: 1rem;
    }
    .pipe-info p { font-size: 0.88rem; color: var(--text); line-height: 1.9; margin-bottom: 0.8rem; }
    .flist { list-style: none; margin-top: 1.4rem; display: flex; flex-direction: column; gap: 0.75rem; }
    .flist li { display: flex; gap: 0.7rem; align-items: center; font-size: 0.84rem; color: var(--text); }
    .flist li::before { content: '▶'; color: var(--green); font-size: 0.55rem; flex-shrink: 0; }

    /* ══════════ AWS SERVICES ══════════ */
    .aws-grid {
      display: grid; grid-template-columns: repeat(4,1fr);
      gap: 1rem; margin-top: 3.5rem;
    }
    .acard {
      border: 1px solid var(--border);
      background: var(--bg2); padding: 1.5rem;
      transition: all 0.25s; position: relative; overflow: hidden;
    }
    .acard::before {
      content: ''; position: absolute; inset: 0;
      background: linear-gradient(135deg, var(--aws-dim), transparent);
      opacity: 0; transition: opacity 0.3s;
    }
    .acard:hover { border-color: var(--aws); transform: translateY(-4px); box-shadow: 0 12px 40px rgba(255,153,0,0.12); }
    .acard:hover::before { opacity: 1; }
    .a-badge { font-size: 0.55rem; font-weight: 700; letter-spacing: 0.18em; text-transform: uppercase; color: var(--aws); margin-bottom: 0.6rem; }
    .a-name { font-family: 'Exo 2', sans-serif; font-size: 0.95rem; font-weight: 700; color: var(--bright); margin-bottom: 0.5rem; }
    .a-desc { font-size: 0.75rem; color: var(--muted); line-height: 1.7; }

    /* ══════════ CONTACT ══════════ */
    .contact-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 5rem; margin-top: 3.5rem; align-items: start; }

    .contact-info h3 { font-family: 'Exo 2', sans-serif; font-size: 1.5rem; font-weight: 800; color: var(--bright); margin-bottom: 1rem; }
    .contact-info p { font-size: 0.88rem; color: var(--text); line-height: 1.9; }

    .cinfo-items { margin-top: 2rem; display: flex; flex-direction: column; gap: 1.2rem; }
    .cinfo-item { display: flex; gap: 1rem; align-items: center; }
    .cinfo-icon {
      width: 42px; height: 42px; background: var(--aws-dim);
      border: 1px solid var(--border); display: flex; align-items: center; justify-content: center;
      flex-shrink: 0;
    }
    .cinfo-icon i { color: var(--aws); font-size: 1rem; }
    .cinfo-label { font-size: 0.65rem; color: var(--muted); letter-spacing: 0.12em; text-transform: uppercase; }
    .cinfo-val { font-size: 0.88rem; color: var(--bright); font-weight: 600; }

    /* form */
    .cform { background: var(--bg2); border: 1px solid var(--border); padding: 2.2rem; }
    .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }
    .form-group { display: flex; flex-direction: column; margin-bottom: 1.2rem; }
    .form-group label {
      font-size: 0.65rem; font-weight: 600; letter-spacing: 0.15em;
      text-transform: uppercase; color: var(--muted); margin-bottom: 0.5rem;
    }
    .form-group input,
    .form-group textarea,
    .form-group select {
      background: var(--bg); border: 1px solid var(--border);
      color: var(--bright); padding: 0.75rem 1rem;
      font-family: 'Rajdhani', sans-serif; font-size: 0.9rem;
      outline: none; transition: border-color 0.2s; width: 100%;
    }
    .form-group input:focus,
    .form-group textarea:focus,
    .form-group select:focus { border-color: var(--aws); }
    .form-group input::placeholder,
    .form-group textarea::placeholder { color: var(--muted); }
    .form-group select option { background: var(--bg2); }
    textarea { resize: vertical; min-height: 100px; }

    .submit-btn {
      width: 100%; background: var(--aws); color: #000; border: none;
      padding: 0.9rem; font-family: 'Exo 2', sans-serif;
      font-weight: 800; font-size: 0.85rem; letter-spacing: 0.12em;
      text-transform: uppercase; cursor: pointer;
      transition: all 0.25s;
      clip-path: polygon(10px 0%,100% 0%,100% calc(100% - 10px),calc(100% - 10px) 100%,0% 100%,0% 10px);
    }
    .submit-btn:hover { background: var(--cyan); transform: translateY(-2px); }

    /* ══════════ FOOTER ══════════ */
    footer {
      background: var(--bg2);
      border-top: 1px solid var(--border);
      padding: 3rem 4rem;
      position: relative; z-index: 1;
    }
    .foot-inner {
      max-width: 1300px; margin: 0 auto;
      display: flex; justify-content: space-between; align-items: center;
      flex-wrap: wrap; gap: 1.5rem;
    }
    .foot-brand { font-family: 'Exo 2', sans-serif; font-weight: 800; font-size: 1.2rem; color: var(--bright); }
    .foot-brand .dot { color: var(--aws); }
    .foot-tagline { font-size: 0.72rem; color: var(--muted); margin-top: 0.2rem; }
    .foot-links { display: flex; gap: 2rem; }
    .foot-links a { font-size: 0.72rem; color: var(--muted); text-decoration: none; letter-spacing: 0.1em; transition: color 0.2s; }
    .foot-links a:hover { color: var(--aws); }
    .foot-copy { font-size: 0.65rem; color: var(--muted); letter-spacing: 0.08em; }

    /* ══════════ ANIMATIONS ══════════ */
    @keyframes fadeUp {
      from { opacity:0; transform:translateY(24px); }
      to   { opacity:1; transform:translateY(0); }
    }

    /* ══════════ RESPONSIVE ══════════ */
    @media (max-width: 1100px) {
      .hero-terminal { display: none; }
      .aws-grid { grid-template-columns: repeat(2,1fr); }
    }
    @media (max-width: 800px) {
      nav { padding: 0 1.5rem; }
      .nav-links { display: none; }
      .wrap { padding: 4rem 1.5rem; }
      .hero { padding-left: 1.5rem; padding-right: 1.5rem; }
      .services-grid, .pipe-grid, .contact-grid, .form-row { grid-template-columns: 1fr; }
      .metrics { grid-template-columns: repeat(2,1fr); }
      .aws-grid { grid-template-columns: 1fr; }
      footer { padding: 2rem 1.5rem; }
      .foot-inner { flex-direction: column; text-align: center; }
    }

    /* scrollbar */
    ::-webkit-scrollbar { width: 4px; }
    ::-webkit-scrollbar-track { background: var(--bg); }
    ::-webkit-scrollbar-thumb { background: var(--border); border-radius: 2px; }
    ::-webkit-scrollbar-thumb:hover { background: var(--aws); }
  </style>
</head>
<body>

<canvas id="particles"></canvas>

<!-- ═══ NAV ═══ -->
<nav>
  <a href="#" class="nav-logo">Nex<span class="dot">Ops</span></a>
  <ul class="nav-links">
    <li><a href="#services">Services</a></li>
    <li><a href="#skills">Skills</a></li>
    <li><a href="#pipeline">Pipeline</a></li>
    <li><a href="#aws">AWS</a></li>
    <li><a href="#contact">Contact</a></li>
  </ul>
  <button class="nav-btn" onclick="document.getElementById('contact').scrollIntoView({behavior:'smooth'})">Hire Me →</button>
</nav>

<!-- ═══ HERO ═══ -->
<div style="position:relative;z-index:1">
<div class="hero">
  <div class="hero-eyebrow">AWS & DevOps Engineering</div>
  <h1>
    Cloud-Native.<br>
    <em>AWS-Powered.</em><br>
    <span class="sub-em">DevOps-Driven.</span>
  </h1>
  <p class="hero-desc">
    I design, build, and automate enterprise-grade infrastructure on AWS — from Kubernetes clusters to zero-downtime CI/CD pipelines. Infrastructure is code. Delivery is continuous.
  </p>
  <div class="hero-actions">
    <a href="#services" class="btn-primary">Explore Services</a>
    <a href="#pipeline" class="btn-outline">View Pipeline →</a>
  </div>
  <div class="live-badge">
    <span class="live-dot"></span>
    Systems Operational — 99.99% Uptime
  </div>

  <!-- terminal -->
  <div class="hero-terminal">
    <div class="term-bar">
      <div class="tdot td-r"></div><div class="tdot td-y"></div><div class="tdot td-g"></div>
      <span class="term-title">deploy.sh — production</span>
    </div>
    <div class="term-body">
      <div class="tl"><span class="tp">❯</span><span class="tc">git push origin main</span></div>
      <div class="to"><span class="tk">trigger:</span> <span class="tv">github-actions / deploy</span></div>
      <br>
      <div class="tl"><span class="tp">❯</span><span class="tc">mvn clean package -Pprod</span></div>
      <div class="to"><span class="tv">✓</span> BUILD SUCCESS <span class="tcm">[3.1s]</span></div>
      <br>
      <div class="tl"><span class="tp">❯</span><span class="tc">docker build &amp; push → ECR</span></div>
      <div class="to"><span class="tv">✓</span> Image: app:sha-4f2a19c <span class="tcm">142MB</span></div>
      <br>
      <div class="tl"><span class="tp">❯</span><span class="tc">kubectl rollout status</span></div>
      <div class="to"><span class="tv">✓</span> 3/3 pods RUNNING <span class="tk">p99:</span><span class="tv">46ms</span></div>
      <br>
      <div class="tl"><span class="tp">❯</span><span class="tc">cloudwatch alarm check</span></div>
      <div class="to"><span class="tv">✓</span> All alarms <span class="tv">OK</span> <span class="tcm">// deploy complete</span></div>
      <br>
      <div class="tl"><span class="tp">❯</span> <span class="blink"></span></div>
    </div>
  </div>
</div>
</div>

<!-- ═══ METRICS ═══ -->
<div class="metrics">
  <div class="metric">
    <div class="m-val">99<sup>.99%</sup></div>
    <div class="m-label">SLA Uptime</div>
  </div>
  <div class="metric">
    <div class="m-val">8<sup>min</sup></div>
    <div class="m-label">Avg Deploy Time</div>
  </div>
  <div class="metric">
    <div class="m-val">500<sup>+</sup></div>
    <div class="m-label">Pipelines Shipped</div>
  </div>
  <div class="metric">
    <div class="m-val">40<sup>%</sup></div>
    <div class="m-label">Cloud Cost Reduced</div>
  </div>
</div>

<!-- ═══ SERVICES ═══ -->
<section id="services" class="services-bg">
  <div class="wrap">
    <div class="sec-tag">What I Do</div>
    <div class="sec-title">End-to-End<br>Cloud & DevOps Services</div>
    <div class="services-grid">

      <div class="svc" style="--svc-color:var(--aws)">
        <span class="svc-icon">☁️</span>
        <div class="svc-name">AWS Cloud Architecture</div>
        <div class="svc-text">Well-Architected multi-region designs on EKS, Lambda, RDS, CloudFront. Fault-tolerant, auto-scaling, cost-optimised.</div>
        <div class="svc-tags"><span class="stag">EKS</span><span class="stag">Lambda</span><span class="stag">RDS</span><span class="stag">CloudFront</span></div>
      </div>

      <div class="svc" style="--svc-color:var(--cyan)">
        <span class="svc-icon">⚙️</span>
        <div class="svc-name">CI/CD Pipelines</div>
        <div class="svc-text">End-to-end automation with Jenkins, GitHub Actions, and AWS CodePipeline. Build → Test → Scan → Deploy → Validate.</div>
        <div class="svc-tags"><span class="stag">Jenkins</span><span class="stag">GitHub Actions</span><span class="stag">ArgoCD</span><span class="stag">GitOps</span></div>
      </div>

      <div class="svc" style="--svc-color:var(--green)">
        <span class="svc-icon">🏗️</span>
        <div class="svc-name">Infrastructure as Code</div>
        <div class="svc-text">Immutable infra with Terraform & AWS CDK. State management, drift detection, and full GitOps-managed environments.</div>
        <div class="svc-tags"><span class="stag">Terraform</span><span class="stag">AWS CDK</span><span class="stag">CloudFormation</span></div>
      </div>

      <div class="svc" style="--svc-color:#a855f7">
        <span class="svc-icon">🐳</span>
        <div class="svc-name">Container Orchestration</div>
        <div class="svc-text">Docker, Kubernetes on EKS, Helm charts, Istio service mesh. Auto-scaling, self-healing, zero-downtime rollouts.</div>
        <div class="svc-tags"><span class="stag">Kubernetes</span><span class="stag">Helm</span><span class="stag">Istio</span><span class="stag">ECS</span></div>
      </div>

      <div class="svc" style="--svc-color:var(--aws)">
        <span class="svc-icon">📊</span>
        <div class="svc-name">Observability & Monitoring</div>
        <div class="svc-text">Full-stack monitoring with Prometheus, Grafana, CloudWatch, X-Ray tracing, ELK stack, and SLO alerting.</div>
        <div class="svc-tags"><span class="stag">Prometheus</span><span class="stag">Grafana</span><span class="stag">X-Ray</span><span class="stag">ELK</span></div>
      </div>

      <div class="svc" style="--svc-color:var(--red)">
        <span class="svc-icon">🔒</span>
        <div class="svc-name">Cloud Security</div>
        <div class="svc-text">IAM least-privilege, VPC hardening, WAF, GuardDuty, Secrets Manager. SOC2, PCI-DSS, HIPAA compliance automation.</div>
        <div class="svc-tags"><span class="stag">IAM</span><span class="stag">WAF</span><span class="stag">KMS</span><span class="stag">GuardDuty</span></div>
      </div>

    </div>
  </div>
</section>

<!-- ═══ SKILLS TABLE ═══ -->
<section id="skills">
  <div class="wrap">
    <div class="sec-tag">Technical Skills</div>
    <div class="sec-title">Tools & Technologies</div>
    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th>Technology</th>
            <th>Category</th>
            <th>Key Use</th>
            <th>Proficiency</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><i class="fas fa-cloud"></i> Amazon EKS</td>
            <td>Container Orchestration</td>
            <td>Managed Kubernetes, node groups, Fargate</td>
            <td><div class="level-bar"><div class="level-fill" style="width:95%"></div></div></td>
          </tr>
          <tr>
            <td><i class="fas fa-code-branch"></i> Terraform</td>
            <td>Infrastructure as Code</td>
            <td>Multi-cloud provisioning, state management</td>
            <td><div class="level-bar"><div class="level-fill" style="width:92%"></div></div></td>
          </tr>
          <tr>
            <td><i class="fas fa-stream"></i> Jenkins</td>
            <td>CI/CD</td>
            <td>Pipeline orchestration, shared libraries</td>
            <td><div class="level-bar"><div class="level-fill" style="width:90%"></div></div></td>
          </tr>
          <tr>
            <td><i class="fab fa-docker"></i> Docker</td>
            <td>Containerisation</td>
            <td>Multi-stage builds, ECR, image scanning</td>
            <td><div class="level-bar"><div class="level-fill" style="width:96%"></div></div></td>
          </tr>
          <tr>
            <td><i class="fas fa-fire"></i> AWS Lambda</td>
            <td>Serverless</td>
            <td>Event-driven, Java 21 SnapStart, Step Functions</td>
            <td><div class="level-bar"><div class="level-fill" style="width:88%"></div></div></td>
          </tr>
          <tr>
            <td><i class="fas fa-chart-line"></i> Prometheus + Grafana</td>
            <td>Observability</td>
            <td>Metrics, dashboards, alerting rules</td>
            <td><div class="level-bar"><div class="level-fill" style="width:87%"></div></div></td>
          </tr>
          <tr>
            <td><i class="fas fa-shield-alt"></i> AWS IAM + GuardDuty</td>
            <td>Security</td>
            <td>Least-privilege, threat detection, compliance</td>
            <td><div class="level-bar"><div class="level-fill" style="width:91%"></div></div></td>
          </tr>
          <tr>
            <td><i class="fas fa-code"></i> GitHub Actions</td>
            <td>CI/CD</td>
            <td>Workflows, matrix builds, OIDC auth to AWS</td>
            <td><div class="level-bar"><div class="level-fill" style="width:93%"></div></div></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</section>

<!-- ═══ PIPELINE ═══ -->
<section id="pipeline" class="pipeline-bg">
  <div class="wrap">
    <div class="sec-tag">DevOps Pipeline</div>
    <div class="sec-title">Code to Production<br>in Under 10 Minutes</div>
    <div class="pipe-grid">
      <div class="pipe-steps">
        <div class="pstep done"><div class="pn">01</div><div><div class="pname">Code Push</div><div class="pdesc">Git push triggers webhook. Branch protection, mandatory PR review.</div></div><span class="pbadge b-done">✓ Done</span></div>
        <div class="pstep done"><div class="pn">02</div><div><div class="pname">Build & Unit Test</div><div class="pdesc">Maven/Gradle compile, JUnit, JaCoCo coverage gate ≥ 80%.</div></div><span class="pbadge b-done">✓ Done</span></div>
        <div class="pstep done"><div class="pn">03</div><div><div class="pname">Docker Build & Scan</div><div class="pdesc">Multi-stage build, Trivy CVE scan, push to Amazon ECR.</div></div><span class="pbadge b-done">✓ Done</span></div>
        <div class="pstep run"><div class="pn">04</div><div><div class="pname">Staging Deploy</div><div class="pdesc">Helm upgrade on EKS staging, smoke + Gatling load tests.</div></div><span class="pbadge b-run">● Live</span></div>
        <div class="pstep wait"><div class="pn">05</div><div><div class="pname">Production Deploy</div><div class="pdesc">Blue-green via ALB, 10% canary traffic split, auto-promote.</div></div><span class="pbadge b-wait">Pending</span></div>
        <div class="pstep wait"><div class="pn">06</div><div><div class="pname">Post-Deploy Validation</div><div class="pdesc">CloudWatch alarms, synthetic canaries, auto-rollback on breach.</div></div><span class="pbadge b-wait">Pending</span></div>
      </div>
      <div class="pipe-info">
        <h3>Zero-Touch. Zero Fear.</h3>
        <p>From <code style="color:var(--aws);font-family:monospace">git push</code> to live production with no manual steps. Every stage is automated, gated, and observable.</p>
        <p>Auto-rollback triggers on SLO breach. GitOps state reconciliation via ArgoCD. Full audit trail in AWS CloudTrail.</p>
        <ul class="flist">
          <li>Blue-green & canary release strategies</li>
          <li>Rollback on error-rate threshold breach</li>
          <li>DAST & SAST scanning in pipeline</li>
          <li>Immutable infra with Terraform & Helm</li>
          <li>Slack + PagerDuty alert integration</li>
          <li>Full deploy audit in CloudTrail + S3</li>
        </ul>
      </div>
    </div>
  </div>
</section>

<!-- ═══ AWS SERVICES ═══ -->
<section id="aws">
  <div class="wrap">
    <div class="sec-tag">AWS Platform</div>
    <div class="sec-title">Core AWS Services<br>I Work With Daily</div>
    <div class="aws-grid">
      <div class="acard"><div class="a-badge">Compute</div><div class="a-name">Amazon EKS</div><div class="a-desc">Managed Kubernetes, auto-scaling node groups, Fargate profiles for serverless pods.</div></div>
      <div class="acard"><div class="a-badge">Serverless</div><div class="a-name">AWS Lambda</div><div class="a-desc">Java 21 with SnapStart for near-zero cold starts. Event-driven and Step Functions.</div></div>
      <div class="acard"><div class="a-badge">Database</div><div class="a-name">Amazon RDS</div><div class="a-desc">Multi-AZ PostgreSQL & MySQL. RDS Proxy for connection pooling, automated backups.</div></div>
      <div class="acard"><div class="a-badge">Messaging</div><div class="a-name">Amazon MSK</div><div class="a-desc">Managed Kafka for event streaming. Spring Kafka integration, consumer group management.</div></div>
      <div class="acard"><div class="a-badge">Storage</div><div class="a-name">Amazon S3</div><div class="a-desc">SDK v2 integration, lifecycle policies, S3 Transfer Acceleration, multipart uploads.</div></div>
      <div class="acard"><div class="a-badge">CDN</div><div class="a-name">CloudFront</div><div class="a-desc">Edge caching for APIs and static assets. Lambda@Edge for auth at the edge.</div></div>
      <div class="acard"><div class="a-badge">Secrets</div><div class="a-name">Secrets Manager</div><div class="a-desc">Runtime injection for Spring Boot. Auto-rotation, KMS encryption, VPC endpoint access.</div></div>
      <div class="acard"><div class="a-badge">Security</div><div class="a-name">GuardDuty + WAF</div><div class="a-desc">Continuous threat detection, managed rule groups, IP reputation lists, rate limiting.</div></div>
    </div>
  </div>
</section>

<!-- ═══ CONTACT ═══ -->
<section id="contact" class="services-bg">
  <div class="wrap">
    <div class="sec-tag">Get In Touch</div>
    <div class="sec-title">Let's Build Something<br>Cloud-Native</div>
    <div class="contact-grid">
      <div class="contact-info">
        <h3>Have an Infrastructure Challenge?</h3>
        <p>Whether you need a scalable AWS architecture, a battle-tested CI/CD pipeline, or a full DevOps transformation — let's talk. I respond within 24 hours.</p>
        <div class="cinfo-items">
          <div class="cinfo-item">
            <div class="cinfo-icon"><i class="fas fa-envelope"></i></div>
            <div><div class="cinfo-label">Email</div><div class="cinfo-val">hello@nexops.dev</div></div>
          </div>
          <div class="cinfo-item">
            <div class="cinfo-icon"><i class="fas fa-map-marker-alt"></i></div>
            <div><div class="cinfo-label">Location</div><div class="cinfo-val">Available Worldwide · Remote</div></div>
          </div>
          <div class="cinfo-item">
            <div class="cinfo-icon"><i class="fab fa-github"></i></div>
            <div><div class="cinfo-label">GitHub</div><div class="cinfo-val">github.com/nexops</div></div>
          </div>
          <div class="cinfo-item">
            <div class="cinfo-icon"><i class="fab fa-linkedin"></i></div>
            <div><div class="cinfo-label">LinkedIn</div><div class="cinfo-val">linkedin.com/in/nexops</div></div>
          </div>
        </div>
      </div>

      <div class="cform">
        <div class="form-row">
          <div class="form-group">
            <label>First Name</label>
            <input type="text" placeholder="John">
          </div>
          <div class="form-group">
            <label>Last Name</label>
            <input type="text" placeholder="Doe">
          </div>
        </div>
        <div class="form-group">
          <label>Email</label>
          <input type="text" placeholder="john@company.com">
        </div>
        <div class="form-group">
          <label>Mobile</label>
          <input type="text" placeholder="+91 98765 43210">
        </div>
        <div class="form-group">
          <label>Service Needed</label>
          <select>
            <option>AWS Cloud Architecture</option>
            <option>CI/CD Pipeline Setup</option>
            <option>Kubernetes & Containers</option>
            <option>Infrastructure as Code</option>
            <option>Security & Compliance</option>
            <option>Full DevOps Transformation</option>
          </select>
        </div>
        <div class="form-group">
          <label>Message</label>
          <textarea placeholder="Describe your infrastructure challenge or project..."></textarea>
        </div>
        <button class="submit-btn">Send Message →</button>
      </div>
    </div>
  </div>
</section>

<!-- ═══ FOOTER ═══ -->
<footer>
  <div class="foot-inner">
    <div>
      <div class="foot-brand">Nex<span class="dot">Ops</span></div>
      <div class="foot-tagline">AWS · DevOps · Cloud-Native Engineering</div>
    </div>
    <div class="foot-links">
      <a href="#services">Services</a>
      <a href="#skills">Skills</a>
      <a href="#pipeline">Pipeline</a>
      <a href="#aws">AWS</a>
      <a href="#contact">Contact</a>
    </div>
    <div class="foot-copy">&copy; 2026 NexOps. All rights reserved.</div>
  </div>
</footer>

<script>
  // ─── PARTICLE CANVAS ───
  const canvas = document.getElementById('particles');
  const ctx = canvas.getContext('2d');
  let W, H, particles = [];

  function resize() {
    W = canvas.width  = window.innerWidth;
    H = canvas.height = window.innerHeight;
  }
  resize();
  window.addEventListener('resize', resize);

  class Particle {
    constructor() { this.reset(); }
    reset() {
      this.x = Math.random() * W;
      this.y = Math.random() * H;
      this.r = Math.random() * 1.2 + 0.3;
      this.vx = (Math.random() - 0.5) * 0.3;
      this.vy = (Math.random() - 0.5) * 0.3;
      this.alpha = Math.random() * 0.4 + 0.1;
      this.color = Math.random() > 0.5 ? '#ff9900' : '#00d2ff';
    }
    draw() {
      ctx.beginPath();
      ctx.arc(this.x, this.y, this.r, 0, Math.PI * 2);
      ctx.fillStyle = this.color;
      ctx.globalAlpha = this.alpha;
      ctx.fill();
    }
    update() {
      this.x += this.vx; this.y += this.vy;
      if (this.x < 0 || this.x > W || this.y < 0 || this.y > H) this.reset();
    }
  }

  for (let i = 0; i < 120; i++) particles.push(new Particle());

  // connect nearby particles
  function connect() {
    for (let i = 0; i < particles.length; i++) {
      for (let j = i + 1; j < particles.length; j++) {
        const dx = particles[i].x - particles[j].x;
        const dy = particles[i].y - particles[j].y;
        const d = Math.sqrt(dx*dx + dy*dy);
        if (d < 100) {
          ctx.beginPath();
          ctx.moveTo(particles[i].x, particles[i].y);
          ctx.lineTo(particles[j].x, particles[j].y);
          ctx.strokeStyle = '#ff9900';
          ctx.globalAlpha = 0.05 * (1 - d/100);
          ctx.lineWidth = 0.5;
          ctx.stroke();
        }
      }
    }
  }

  function animate() {
    ctx.clearRect(0, 0, W, H);
    particles.forEach(p => { p.update(); p.draw(); });
    connect();
    requestAnimationFrame(animate);
  }
  animate();

  // ─── SCROLL FADE-IN ───
  const fadeEls = document.querySelectorAll('.svc, .acard, .metric, .pstep, tbody tr');
  fadeEls.forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(18px)';
    el.style.transition = 'opacity 0.5s ease, transform 0.5s ease, background 0.25s, border-color 0.25s';
  });

  const io = new IntersectionObserver(entries => {
    entries.forEach((e, i) => {
      if (e.isIntersecting) {
        setTimeout(() => {
          e.target.style.opacity = '1';
          e.target.style.transform = 'translateY(0)';
        }, 60 * (Array.from(fadeEls).indexOf(e.target) % 6));
        io.unobserve(e.target);
      }
    });
  }, { threshold: 0.12 });
  fadeEls.forEach(el => io.observe(el));

  // ─── NAV ACTIVE ON SCROLL ───
  const sections = document.querySelectorAll('section[id]');
  const navAs = document.querySelectorAll('.nav-links a');
  window.addEventListener('scroll', () => {
    let cur = '';
    sections.forEach(s => { if (window.scrollY >= s.offsetTop - 120) cur = s.id; });
    navAs.forEach(a => {
      a.style.color = a.getAttribute('href') === '#' + cur ? 'var(--aws)' : '';
    });
  });
</script>
</body>
</html>
