<?php
class ControllerExtensionModuleSlideshowMy extends Controller {
	public function index($setting) {
		static $module = 0;		

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/swiperjs/swiper-bundle.min.css');		

		$this->document->addScript('catalog/view/javascript/jquery/swiperjs/swiper-bundle.min.js');
		$this->document->addScript('https://cdn.jsdelivr.net/npm/lozad/dist/lozad.min.js');


		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image']) && $result['date_start'] <= date("Y-m-d") && $result['date_end'] >= date("Y-m-d")) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']),
					'date_start' => $result['date_start'],
					'date_end'   => $result['date_end']
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('extension/module/slideshow_my', $data);
	}
}
