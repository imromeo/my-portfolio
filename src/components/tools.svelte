<script>
    import { onMount } from "svelte";

    let items = [];
    let active = 3;

    const alfa = [
        { src: 'me/alfa1.png', alt: 'edge' },
        { src: 'me/alfa2.png', alt: 'side' },
        { src: 'me/alfa3.png', alt: 'center' },
        { src: 'me/alfa4.png', alt: 'side' },
        { src: 'me/alfa5.png', alt: 'edge' }
      ];
  
    function loadShow() {
        items.forEach((item, index) => {
            item.style.transform = 'rotateY(90deg)';
            item.style.opacity = 1;
        });
    }

    onMount(() => {
        loadShow();
    });
</script>
  
<div class="flex justify-center items-center h-screen bg-[#820300]">
    <div class="slider" style="display: flex; perspective: 1000px;">
        {#each alfa as item, index}
            <div class="tool" bind:this={items[index]} style={`left: ${index * 10}px`}>
                <img src={item.src} alt={item.alt} />
            </div>
        {/each}
    </div>
</div>