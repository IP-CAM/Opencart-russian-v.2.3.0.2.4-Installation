<div id="slideshow_my<?php echo $module; ?>" class="swiper-container" style="opacity: 1;">
  <div class="swiper-wrapper">

    <?php foreach ($banners as $banner) {
    ?>

    <div class="swiper-slide">
      <?php if ($banner['link']) { ?>
      <a href="<?php echo $banner['link']; ?>"><img data-src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive swiper-lazy" /></a>
      <?php } else { ?>
      <img data-src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive swiper-lazy"/>
      <?php } ?>
    </div>
    <?php } ?>
  </div>
  <!-- If we need pagination -->
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>

</div>

<script type="text/javascript"><!--

const swiper = new Swiper('#slideshow_my<?php echo $module; ?>', {
  loop:true,
  lazy: true,

  // If we need pagination
  pagination: {
    el: '.swiper-pagination',
  },

  // Navigation arrows
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },

});
--></script>
