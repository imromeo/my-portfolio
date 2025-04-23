<script>    
    const defaultRotations = {
        left2: 60,
        left1: 30,
        center: 0,
        right1: -30,
        right2: -60
    };

    let rotations = { ...defaultRotations };

    const images = [
        { position: 'left2', src: 'me/alfa1.png', mask: 'svg/ABOUT.svg', index: 3, scale: 1.2 },
        { position: 'left1', src: 'me/alfa2.png', mask: 'svg/TOOLS.svg', index: 1, scale: 1.05 },
        { position: 'center', src: 'me/alfa3.png', mask: 'svg/PROJECTS.svg', index: 0, scale: 1 },
        { position: 'right1', src: 'me/alfa4.png', mask: 'svg/SOCIALS.svg', index: 1, scale: 1.05 },
        { position: 'right2', src: 'me/alfa5.png', mask: 'svg/CONTACT.svg', index: 3, scale: 1.2 }
    ];

    const corners = [
        { position: 'top: 20px; left: 20px', scale: 'scale: -1 -1' },
        { position: 'top: 20px; right: 20px', scale: 'scale: 1 -1' },
        { position: 'bottom: 20px; left: 20px', scale: 'scale: -1 1' },
        { position: 'bottom: 20px; right: 20px', scale: 'scale: 1 1' }
    ];

    function handleMousemove(event, position) {
        const { left, width } = event.currentTarget.getBoundingClientRect();
        const relativeX = event.clientX - left;
        rotations[position] = ((relativeX - width / 2) / width) * 50;
    }

    function handleMouseLeave(position) {
        rotations[position] = defaultRotations[position];
    }
</script>


<div class="flex items-center justify-center h-screen bg-[#820300] [perspective:1000px]">
    {#each corners as { position, scale }}
        <img class="absolute" style="{position}; {scale};" src='svg/batik.svg' alt='batik' />
    {/each}

    {#each images as { position, src, mask, index, scale }}
        <div
            role="img"
            class="duration-300"
            style="
                transform: rotateY({rotations[position]}deg) scale({scale});
                -webkit-mask-image: url('{mask}');
                mask-image: url('{mask}');
                mask-size: cover;
                z-index: {index};
            "
            on:mousemove={(event) => handleMousemove(event, position)}
            on:mouseleave={() => handleMouseLeave(position)}
        >
            <img src={src} alt={position} />
        </div>
    {/each}
</div>
