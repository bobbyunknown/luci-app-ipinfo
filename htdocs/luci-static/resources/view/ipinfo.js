/* This is free software, licensed under the Apache License, Version 2.0
 *
 * Copyright (C) 2024 Hilman Maulana <hilman0.0maulana@gmail.com>
 * Contributor: BobbyUnknown telegram https://t.me/BobbyUn_kown
 */

'use strict';
'require view';
'require form';

return view.extend({
	render: function () {
		var m, s, o;
		m = new form.Map('ipinfo', _('IP Information'),
			_('Menampilkan informasi IP publik di Overview LuCI dengan <a %s>ipgeolocation.io</a>. Silakan daftar ulang jika TOKEN LIMIT').format('href="https://ipgeolocation.io" target="_blank"'));
		s = m.section(form.NamedSection, 'config', 'ipinfo');
		s.anonymous = true;

		o = s.option(form.Flag, 'enable', _('Enable'),
			_('Enable or disable service.'));
		o.rmempty = false;

		o = s.option(form.MultiValue, 'isp', _('Provider Information'),
			_('Select ISP information to display.'));
		o.display_size = '4';
		o.value('ip', _('IP Publik'));
		o.value('isp', _('Provider'));
		o.value('organization', _('Organisasi'));
		o.value('country_name_official', _('Nama resmi negara'));

		o = s.option(form.MultiValue, 'loc', _('Location Information'),
			_('Select location information to display.'));
		o.display_size = '3';
		o.value('city', _('Kota'));
		o.value('country_name', _('Negara'));
		o.value('time_zone.name', _('Zona waktu'));

		o = s.option(form.MultiValue, 'co', _('Coordinate Information'),
			_('Select coordinate information to display.'));
		o.display_size = '2';
		o.value('latitude', _('Latitude'));
		o.value('longitude', _('Longitude'));

		o = s.option(form.Value, 'token', _('Token'),
			_('Masukkan token untuk otentikasi.'));
		o.password = true;

		return m.render();
	},
});
